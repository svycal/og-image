defmodule OgImageWeb.ImageController do
  use OgImageWeb, :controller

  import OgImageWeb.ImageHelpers
  import OgImageWeb.ImageRenderer

  def show(conn, %{"template" => "light_old", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:light_old)
  end

  def show(conn, %{"template" => "dark", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:dark)
  end

  def show(conn, %{"template" => "light_new", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:light_new)
  end

  def show(conn, %{"template" => "light", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:light)
  end

  def show(conn, %{"template" => "sprites_halftone", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:sprites_halftone)
  end

  # `sprites` is the primary (noir split) template — ignores the `text` param.
  def show(conn, %{"template" => "sprites"}), do: render_image(conn, :sprites)

  # Docs template — honours `text` as the page title (defaults when omitted).
  def show(conn, %{"template" => "sprites_docs", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:sprites_docs)
  end

  def show(conn, %{"template" => "sprites_docs"}) do
    conn
    |> assign(:text, "Documentation")
    |> render_image(:sprites_docs)
  end

  def show(conn, %{"template" => "machines_api", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:machines_api)
  end

  # -- Add more templates here --

  def show(conn, _params) do
    render_image(conn, :fallback)
  end
end
