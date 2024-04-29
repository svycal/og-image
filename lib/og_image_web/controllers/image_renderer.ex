defmodule OgImageWeb.ImageRenderer do
  @moduledoc """
  Functions responsible for rendering images.
  """

  import Phoenix.Controller
  import Phoenix.Template, only: [render_to_string: 4]
  import Plug.Conn

  alias OgImageWeb.ImageHTML

  @doc """
  Renders the image template as either a PNG or HTML response (depending on the path).
  """
  @spec render_image(Plug.Conn.t(), template :: atom()) :: Plug.Conn.t()
  def render_image(%{path_info: ["image"]} = conn, template) do
    assigns = Map.put(conn.assigns, :layout, {OgImageWeb.Layouts, "image"})
    html = render_to_string(ImageHTML, to_string(template), "html", assigns)

    image =
      "take-screenshot"
      |> NodeJS.call!([html], binary: true)
      |> Base.decode64!()

    conn
    |> put_resp_content_type("image/png", nil)
    |> put_resp_header(
      "cache-control",
      "public, immutable, no-transform, s-maxage=31536000, max-age=31536000"
    )
    |> send_resp(200, image)
  end

  # When the request path is `/preview`, return the HTML representation
  def render_image(%{path_info: ["preview"]} = conn, template) do
    render(conn, template)
  end
end
