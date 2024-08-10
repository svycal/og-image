# Open Graph Image Generator by [SavvyCal](https://savvycal.com/?utm_source=github&utm_medium=oss&utm_campaign=og-image)

`og-image` is a web service for generating [Open Graph images](https://opengraphprotocol.org/) for your webpages. 
This project was originally inspired by [Vercel OG image](https://github.com/vercel/og-image), with some additional features:

✅ Extensible templating system \
✅ [Tailwind CSS](https://tailwindcss.com/) for styling image templates \
✅ Emoji support \
✅ Ready for deployment to [Fly](https://fly.io/)

The result: beautiful open graph images like this one, generated from custom HTML/CSS templates!

![OG image example](https://og-image.savvycal.com/image?template=simple_green&text=The+fresh+way+to+find+a+time+to+meet.)

Source: https://og-image.savvycal.com/image?template=simple_green&text=The+fresh+way+to+find+a+time+to+meet.

## Getting started

Fork this repository and clone it locally. You'll need the following prerequisites installed:

- [Elixir](https://elixir-lang.org/install.html)
- [Google Chrome](https://www.google.com/chrome/index.html)
- [Node.js (18.x)](https://github.com/nvm-sh/nvm#installing-and-updating)

Run the bootstrap script to install dependencies:

```bash
script/bootstrap
```

Then, run the following to boot the server:

```bash
script/server
```

Visit [http://localhost:4000/image?template=light&text=Hello+World!](http://localhost:4000/image?template=light&text=Hello+World!) to see it in action!

## Creating your own templates

This projects contains `light` and `dark` templates that display a logo and some user-supplied text. These are just a starting point to give you a sense for how it works. Adding new templates and modifying existing ones is easy!

To get started, open the [`OgImageWeb.ImageController`](https://github.com/svycal/og-image/blob/main/lib/og_image_web/controllers/image_controller.ex) file.

```elixir
defmodule OgImageWeb.ImageController do
  use OgImageWeb, :controller

  import OgImageWeb.ImageHelpers
  import OgImageWeb.ImageRenderer

  # Match on the `template` param to decide which template to render. The
  # `render_image` function is a special helper that either renders the PNG
  # (when path is `/image`) or renders the HTML (when path is `/preview`).

  def show(conn, %{"template" => "light", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:light)
  end

  def show(conn, %{"template" => "dark", "text" => text}) do
    conn
    |> assign(:text, prepare_html(text))
    |> render_image(:dark)
  end

  # -- Add more templates here --

  def show(conn, _params) do
    render_image(conn, :fallback)
  end
end
```

The template markup is defined in the [`OgImageWeb.ImageHTML`](https://github.com/svycal/og-image/blob/main/lib/og_image_web/controllers/image_html.ex) module.

```elixir
defmodule OgImageWeb.ImageHTML do
  use OgImageWeb, :html

  @doc """
  A logo and text on a light background.
  """
  def light(assigns) do
    ~H"""
    <body class="bg-[#F8F2E6] flex flex-col h-screen">
      <div class="shrink-0 pt-24 px-20 text-gray-900">
        <.fly_logo />
      </div>
      <div class="grow flex items-center px-20">
        <h1 class="font-extrabold text-gray-900 text-[7rem] leading-[1.2]">
          <%= @text %>
        </h1>
      </div>
    </body>
    """
  end

  # -- truncated for brevity --
end
```

These templates are wired up for Tailwind CSS by default. You're welcome to define reuable components and helper functions (like we've done with the `<.fly_logo />` component, which is defined in the `OgImageWeb.SharedComponents` module).

The image controller serves content over two different routes:

- `/preview` for an HTML preview of the image contents
- `/image` for the actual rendered image (in PNG format)

> [!TIP]
> Use the Responsive Mode and set the viewport to `1200 x 630` pixels to see the HTML preview in the same dimensions as the PNG image. This is great for testing and dialing in your designs quickly (without re-rendering the PNG on every change).

## Customizing styles

The CSS styles for image templates are defined in the [`OgImageWeb.Layouts.image_template_styles/1`](https://github.com/svycal/og-image/blob/main/lib/og_image_web/components/layouts.ex) component. For performance, all definitions (including fonts) are inlined inside a `<style>` tag and rendered directly on page (so that the headless browser doesn't need to make any network requests when rendering the image).

## Deploying to Fly

This application is ready for Fly deployment with a pre-configured Dockerfile and release scripts. 

In short, you'll need to install the Fly CLI, sign up (or log in to your existing) Fly account, run the launch command for initial deployment, and the deploy command for subsequent deployments.

```bash
$ fly auth login
$ fly launch
$ fly deploy
```

For a complete guide to deploying Phoenix applications (like this one), check out the guide: [https://hexdocs.pm/phoenix/fly.html](https://hexdocs.pm/phoenix/fly.html).

## How It (Technically) Works

We're employing a time-honored technique of screenshotting the contents of a headless browser (via [Puppeteer](https://pptr.dev/)) to generate images. Since the rest of the project is implemented in Elixir, we rely on the [nodejs](https://hexdocs.pm/nodejs/readme.html#content) hex package to interface with a pool of Node.js processes.

We define two Node.js functions:

* [`emojify`](https://github.com/svycal/og-image/blob/main/priv/js/emojify.js) for converting emoji to images
* [`takeScreenshot`](https://github.com/svycal/og-image/blob/main/priv/js/take-screenshot.js) for rendering templates in a Puppeteer browser and capturing a screenshot

The [`OgImageWeb.ImageRenderer.render_image/2`](https://github.com/svycal/og-image/blob/main/lib/og_image_web/controllers/image_renderer.ex) function is responsible for dispatching requests the `takeScreenshot` function and returning the image data via the `Plug.Conn`.

## Observability

### New Relic

To enable New Relic monitoring, add your license key to your Fly secrets.

```bash
fly secrets set NEW_RELIC_LICENSE_KEY=...
```

If desired, update `NEW_RELIC_APP_NAME` in `fly.toml` to something of your choosing.

### Honeybadger

To enable Honeybadger monitoring, add your API key to your Fly secrets.

```bash
fly secrets set HONEYBADGER_API_KEY=...
```

### Logflare

To enable Logflare, add your source ID and API key to your Fly secrets.

```bash
fly secrets set LOGFLARE_SOURCE_ID=...
fly secrets set LOGFLARE_API_KEY=...
```

---

Maintained with ♥️ by the [SavvyCal](https://savvycal.com/?utm_source=github&utm_medium=oss&utm_campaign=og-image) team
