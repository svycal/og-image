defmodule OgImageWeb.Router do
  use OgImageWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {OgImageWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :image do
    plug :accepts, ["html", "png"]
    plug :put_root_layout, false
    plug :put_layout, html: {OgImageWeb.Layouts, :image}
  end

  scope "/", OgImageWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/", OgImageWeb do
    pipe_through :image

    get "/image", ImageController, :show
    get "/preview", ImageController, :show
  end
end
