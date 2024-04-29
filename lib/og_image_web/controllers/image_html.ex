defmodule OgImageWeb.ImageHTML do
  use OgImageWeb, :html

  @doc """
  A logo and text on a light background.
  """
  def light(assigns) do
    ~H"""
    <body class="bg-[#F8F2E6] flex flex-col h-screen">
      <div class="shrink-0 pt-24 px-20 text-gray-900">
        <.savvycal_logo />
      </div>
      <div class="grow flex items-center px-20">
        <h1 class="font-extrabold text-gray-900 text-[7rem] leading-[1.2]">
          <%= @text %>
        </h1>
      </div>
    </body>
    """
  end

  @doc """
  A logo and text on a dark background.
  """
  def dark(assigns) do
    ~H"""
    <body class="bg-green-texture flex flex-col h-screen">
      <div class="shrink-0 pt-24 px-20 text-white">
        <.savvycal_logo />
      </div>
      <div class="grow flex items-center px-20">
        <h1 class="font-extrabold text-[#D2FD88] text-[7rem] leading-[1.2]">
          <%= @text %>
        </h1>
      </div>
    </body>
    """
  end

  @doc """
  A fallback image.
  """
  def fallback(assigns) do
    ~H"""
    <body class="bg-[#F8F2E6] flex items-center justify-center h-screen">
      <div>
        <.savvycal_logo height="148" />
      </div>
    </body>
    """
  end
end
