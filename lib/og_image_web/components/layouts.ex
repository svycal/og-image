defmodule OgImageWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available. The "root" layout is
  a skeleton rendered as part of the application router. The "app" layout is set
  as the default layout on both `use OgImageWeb, :controller` and `use
  OgImageWeb, :live_view`.
  """

  use OgImageWeb, :html

  embed_templates "layouts/*"

  @doc """
  Renders a <style> block containing all Tailwind utilities, fonts, and other
  styles that should be present on the page for image templates.
  """
  def image_template_styles(assigns) do
    ~H"""
    <style>
      /**
       * Include Inter font.
       */
      @font-face {
        font-family: InterVariable;
        font-style: normal;
        font-weight: 100 900;
        font-display: swap;
        src: url(<%= font_to_base64_url("mackinac-bold.woff2") %>) format("woff2");
      }

      @font-face {
        font-family: InterVariable;
        font-style: italic;
        font-weight: 100 900;
        font-display: swap;
        src: url(<%= font_to_base64_url("InterVariable-Italic.woff2") %>) format("woff2");
      }

      @font-face {
        font-family: 'PolySans';
        font-style: normal;
        font-weight: 500;
        font-display: swap;
        src: url(<%= font_to_base64_url("polysans-median.woff2") %>) format("woff2");
      }

      @font-face {
        font-family: 'Fricolage Grotesque';
        font-style: normal;
        font-weight: 100 900;
        font-display: swap;
        src: url(<%= font_to_base64_url("fricolage-grotesque.var.woff2") %>) format("woff2");
      }

      :root {
        font-family: InterVariable, sans-serif;
        font-feature-settings: 'liga' 1, 'calt' 1; /* fix for Chrome */
      }

      /* Include all styles from `app.css` */

      <%= raw(app_css()) %>

      .bg-green-texture {
        background-image: url(<%= image_to_base64_url("green-texture.jpg") %>);
      }

      .bg-purple-texture {
        <%!-- background-image: url(<%= image_to_base64_url("purple-texture.svg") %>); --%>
        background-image: url(<%= image_to_base64_url("cloud-city.webp") %>);
        position: relative;
        width: 100%;
        background-size: 100% 390px;
        background-clip: content-box;
        background-position: bottom center;
        background-repeat: no-repeat;
      }

      .bg-cloud-city {
        position: relative;
        width: 100%;
        background-image: url(<%= image_to_base64_url("cloud-city.webp") %>);
        background-size: 100% 390px;
        background-clip: content-box;
        background-position: bottom center;
        background-repeat: no-repeat;
        <%!-- margin-bottom: 100px; --%>
      }

      .bg-sprites {
        background-color: #17141f;
      }

      .bg-sprites-pattern {
        background-image: url(<%= image_to_base64_url("bmxy.png") %>);
        background-size: cover;
        background-position: center;
      }

      .bg-sprites-noise {
        background-image: url(<%= image_to_base64_url("noise.svg") %>);
        background-repeat: repeat;
        background-size: 150px 150px;
      }

      .font-sprites-heading {
        font-family: 'PolySans', ui-sans-serif, system-ui, sans-serif;
      }

      .font-sprites-body {
        font-family: 'Fricolage Grotesque', ui-sans-serif, system-ui, sans-serif;
      }
    </style>
    """
  end

  # Public helpers

  def image_to_base64_url(file_name) do
    content_type = MIME.from_path(file_name)

    data =
      [Application.app_dir(:og_image), "priv/static/images/#{file_name}"]
      |> Path.join()
      |> File.read!()
      |> Base.encode64()

    "data:#{content_type};base64,#{data}"
  end

  # Private helpers

  defp app_css do
    File.read!(Path.join([Application.app_dir(:og_image), "priv/static/assets/app.css"]))
  end

  defp font_to_base64_url(file_name) do
    data =
      [Application.app_dir(:og_image), "priv/fonts/#{file_name}"]
      |> Path.join()
      |> File.read!()
      |> Base.encode64()

    "data:font/woff2;charset=utf-8;base64,#{data}"
  end

end
