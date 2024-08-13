defmodule OgImageWeb.ImageHTML do
  use OgImageWeb, :html

  @doc """
  A logo and text on a light_old background.
  """
  def light_old(assigns) do
    ~H"""
    <body class="bg-cloud-city flex flex-col h-screen">
      <div class="shrink-0 pt-24 px-20">
        <.fly_logo />
      </div>
      <div class="grow flex items-center px-20">
        <h1 class="font-extrabold bg-gradient-to-b from-[#2A1863] via-[#2A1863] to-indigo-800 inline-block text-transparent bg-clip-text text-[5rem] leading-[1.2]">
          <%= @text %>
        </h1>
      </div>
    </body>
    """
  end

  def light(assigns) do
    ~H"""
    <body class="bg-cloud-city flex flex-col h-screen">
      <svg
        class="pointer-events-none absolute left-1/2 -translate-x-1/2 top-0 w-full min-w-[75rem] h-auto"
        width="1200"
        height="241"
        viewBox="0 0 1200 241"
        fill="none"
      >
        <g opacity=".175" filter="url(#filter0_f)">
          <path
            d="M731.735 -179.55C596.571 -157.762 516.36 -74.1815 552.576 7.13199C588.793 88.4455 727.724 136.701 862.887 114.913C998.051 93.1247 1078.26 9.54454 1042.05 -71.769C1005.83 -153.082 866.898 -201.337 731.735 -179.55Z"
            fill="url(#paint0_linear)"
          />
          <path
            d="M378 114.106C520.489 114.106 636 45.8883 636 -38.2623C636 -122.413 520.489 -190.63 378 -190.63C235.511 -190.63 120 -122.413 120 -38.2623C120 45.8883 235.511 114.106 378 114.106Z"
            fill="url(#paint1_linear)"
          />
        </g>
        <defs>
          <filter
            id="filter0_f"
            x="0"
            y="-310.63"
            width="1170.74"
            height="550.775"
            filterUnits="userSpaceOnUse"
            color-interpolation-filters="sRGB"
          >
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="60" result="effect1_foregroundBlur" />
          </filter>
          <linearGradient
            id="paint0_linear"
            x1="567.5"
            y1="1.03997"
            x2="1029.02"
            y2="64.6468"
            gradientUnits="userSpaceOnUse"
          >
            <stop stop-color="#001AFF" />
            <stop offset="1" stop-color="#6EE5C2" />
          </linearGradient>
          <linearGradient
            id="paint1_linear"
            x1="155"
            y1="-11.0234"
            x2="511.855"
            y2="-162.127"
            gradientUnits="userSpaceOnUse"
          >
            <stop stop-color="#FFC83A" />
            <stop offset="0.504191" stop-color="#FF008A" />
            <stop offset="1" stop-color="#6100FF" />
          </linearGradient>
        </defs>
      </svg>
      <div class="logo shrink-0 pt-24 px-20">
        <.fly_logo />
      </div>
      <div class="title grow flex pt-24 px-20">
        <h1 class="font-extrabold bg-gradient-to-b from-[#2A1863] via-[#2A1863] to-indigo-800 inline-block text-transparent bg-clip-text text-[5rem] leading-[1.2]">
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
    <body class="bg-purple-texture flex flex-col h-screen">
      <div class="shrink-0 pt-24 px-20 text-white">
        <.fly_logo_dark />
      </div>
      <div class="grow flex items-center px-20">
        <h1 class="font-extrabold text-white text-[7rem] leading-[1.2]">
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
        <.fly_logo height="148" />
      </div>
    </body>
    """
  end
end
