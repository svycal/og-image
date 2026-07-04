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

  def light_new(assigns) do
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

  def light(assigns) do
    ~H"""
    <body class="bg-white flex h-screen relative overflow-hidden">
      <!-- Pencil grid background -->
      <div class="absolute inset-0 overflow-hidden pointer-events-none" style="
        background-image: linear-gradient(135deg, 
          hsla(217, 91%, 60%, 0.3),
          hsla(277, 87%, 63%, 0.2),
          hsla(189, 94%, 43%, 0.15)),
        url('data:image/svg+xml,<svg width=&quot;40&quot; height=&quot;40&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;><defs><pattern id=&quot;grid&quot; width=&quot;40&quot; height=&quot;40&quot; patternUnits=&quot;userSpaceOnUse&quot;><rect width=&quot;40&quot; height=&quot;40&quot; fill=&quot;none&quot;/><path d=&quot;M 40 0 L 0 0 0 40&quot; fill=&quot;none&quot; stroke=&quot;%23D1D5DB&quot; stroke-width=&quot;1.2&quot; opacity=&quot;0.6&quot;/><path d=&quot;M 40 0.3 L 0.2 -0.1 0.1 39.8&quot; fill=&quot;none&quot; stroke=&quot;%236B7280&quot; stroke-width=&quot;1&quot; opacity=&quot;0.4&quot;/></pattern></defs><rect width=&quot;100%&quot; height=&quot;100%&quot; fill=&quot;url(%23grid)&quot;/></svg>');
        -webkit-mask: radial-gradient(ellipse 120% 100% at 30% 70%, hsla(0, 0%, 0%, 0.8), hsla(0, 0%, 0%, 0.1) 70%);
        mask: radial-gradient(ellipse 120% 100% at 30% 70%, hsla(0, 0%, 0%, 0.8), hsla(0, 0%, 0%, 0.1) 70%);
      "></div>
      
      <!-- Main content area -->
      <div class="flex-1 flex items-center pl-16 pr-12 pb-8">
        <!-- Text section -->
        <div class="flex-1 pr-12 relative z-10">
          <!-- Logo and URL -->
          <div class="mb-10 flex items-center gap-4">
            <div class="w-16 h-16">
              <.fly_logomark />
            </div>
            <span class="relative inline-block text-3xl font-semibold text-[#1a1347] tracking-tight">
              fly.io/docs
              <svg
                viewBox="0 0 1213 73"
                aria-hidden="true"
                preserveAspectRatio="none"
                height="6"
                class="absolute -bottom-0.5 left-0 w-full h-1.5"
              >
                <path
                  fill="url(#underline-gradient-top)"
                  d="M1213.19 35.377c2.37-13.011-22.95-10.753-31.04-14.087C1086.89 5.705 911.742 2.887 815.218 2.809c-78.003.231-155.966-1.833-233.961.481-57.545.429-114.885 6.164-172.419 7.383-121.164 5.39-242.94 10.751-362.507 32.199-12.356 3.286-25.614 4.255-37.332 9.401-29.507 22.983 27.103 20.15 39.468 17.234 357.956-47.703 362.767-46.261 636.452-50.97 121.033-2.508 241.892 6.658 428.341 19.243 4.74.404 8.98-4.032 8-8.788a942.105 942.105 0 0154.69 6.378c9.44 1.843 18.92 3.583 28.29 5.729 4.01.839 8.02-1.718 8.95-5.712v-.01z"
                />
                <defs>
                  <linearGradient id="underline-gradient-top" gradientTransform="rotate(110)">
                    <stop offset="5%" stop-color="#CA7FF8" />
                    <stop offset="95%" stop-color="#795BE9" />
                  </linearGradient>
                </defs>
              </svg>
            </span>
          </div>
          <%
            # Extract string from {:safe, text} tuple if needed
            raw_text = case @text do
              {:safe, text} -> text
              text when is_binary(text) -> text
              _ -> to_string(@text)
            end
            clipped_text = OgImageWeb.ImageHTML.clip_text(raw_text, 20)
            text_size_class = OgImageWeb.ImageHTML.get_text_size(clipped_text)
          %>
          <h1 class={"font-extrabold bg-gradient-to-br from-[#1a1347] via-[#2A1863] to-[#4338ca] inline-block text-transparent bg-clip-text leading-tight tracking-tight break-words #{text_size_class}"}>
            <%= clipped_text %>
          </h1>
        </div>
        
        <!-- Frankie image section -->
        <div class="flex items-center justify-center relative flex-shrink-0">
          <div class="relative">
            <!-- Subtle glow behind frankie -->
            <div class="absolute inset-0 bg-purple-300/20 rounded-full blur-2xl scale-110"></div>
            <img src={OgImageWeb.Layouts.image_to_base64_url("frankie.webp")} alt="Frankie" class="relative w-auto" style="mix-blend-mode: multiply; height: 22rem;" />
          </div>
        </div>
      </div>
    </body>
    """
  end

  @doc """
  A logo and text on a light background, labelled "Machines API".
  Duplicated from `light/1`.
  """
  def machines_api(assigns) do
    ~H"""
    <body class="bg-white flex h-screen relative overflow-hidden">
      <!-- Pencil grid background -->
      <div class="absolute inset-0 overflow-hidden pointer-events-none" style="
        background-image: linear-gradient(135deg,
          hsla(217, 91%, 60%, 0.3),
          hsla(277, 87%, 63%, 0.2),
          hsla(189, 94%, 43%, 0.15)),
        url('data:image/svg+xml,<svg width=&quot;40&quot; height=&quot;40&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;><defs><pattern id=&quot;grid&quot; width=&quot;40&quot; height=&quot;40&quot; patternUnits=&quot;userSpaceOnUse&quot;><rect width=&quot;40&quot; height=&quot;40&quot; fill=&quot;none&quot;/><path d=&quot;M 40 0 L 0 0 0 40&quot; fill=&quot;none&quot; stroke=&quot;%23D1D5DB&quot; stroke-width=&quot;1.2&quot; opacity=&quot;0.6&quot;/><path d=&quot;M 40 0.3 L 0.2 -0.1 0.1 39.8&quot; fill=&quot;none&quot; stroke=&quot;%236B7280&quot; stroke-width=&quot;1&quot; opacity=&quot;0.4&quot;/></pattern></defs><rect width=&quot;100%&quot; height=&quot;100%&quot; fill=&quot;url(%23grid)&quot;/></svg>');
        -webkit-mask: radial-gradient(ellipse 120% 100% at 30% 70%, hsla(0, 0%, 0%, 0.8), hsla(0, 0%, 0%, 0.1) 70%);
        mask: radial-gradient(ellipse 120% 100% at 30% 70%, hsla(0, 0%, 0%, 0.8), hsla(0, 0%, 0%, 0.1) 70%);
      "></div>

      <!-- Main content area -->
      <div class="flex-1 flex items-center pl-16 pr-12 pb-8">
        <!-- Text section -->
        <div class="flex-1 pr-12 relative z-10">
          <!-- Logo and URL -->
          <div class="mb-10 flex items-center gap-4">
            <div class="w-16 h-16">
              <.fly_logomark />
            </div>
            <span class="relative inline-block text-3xl font-semibold text-[#1a1347] tracking-tight">
              Machines API
              <svg
                viewBox="0 0 1213 73"
                aria-hidden="true"
                preserveAspectRatio="none"
                height="6"
                class="absolute -bottom-0.5 left-0 w-full h-1.5"
              >
                <path
                  fill="url(#underline-gradient-top)"
                  d="M1213.19 35.377c2.37-13.011-22.95-10.753-31.04-14.087C1086.89 5.705 911.742 2.887 815.218 2.809c-78.003.231-155.966-1.833-233.961.481-57.545.429-114.885 6.164-172.419 7.383-121.164 5.39-242.94 10.751-362.507 32.199-12.356 3.286-25.614 4.255-37.332 9.401-29.507 22.983 27.103 20.15 39.468 17.234 357.956-47.703 362.767-46.261 636.452-50.97 121.033-2.508 241.892 6.658 428.341 19.243 4.74.404 8.98-4.032 8-8.788a942.105 942.105 0 0154.69 6.378c9.44 1.843 18.92 3.583 28.29 5.729 4.01.839 8.02-1.718 8.95-5.712v-.01z"
                />
                <defs>
                  <linearGradient id="underline-gradient-top" gradientTransform="rotate(110)">
                    <stop offset="5%" stop-color="#CA7FF8" />
                    <stop offset="95%" stop-color="#795BE9" />
                  </linearGradient>
                </defs>
              </svg>
            </span>
          </div>
          <%
            # Extract string from {:safe, text} tuple if needed
            raw_text = case @text do
              {:safe, text} -> text
              text when is_binary(text) -> text
              _ -> to_string(@text)
            end
            clipped_text = OgImageWeb.ImageHTML.clip_text(raw_text, 20)
            text_size_class = OgImageWeb.ImageHTML.get_text_size(clipped_text)
          %>
          <h1 class={"font-extrabold bg-gradient-to-br from-[#1a1347] via-[#2A1863] to-[#4338ca] inline-block text-transparent bg-clip-text leading-tight tracking-tight break-words #{text_size_class}"}>
            <%= clipped_text %>
          </h1>
        </div>

        <!-- Frankie image section -->
        <div class="flex items-center justify-center relative flex-shrink-0">
          <div class="relative">
            <!-- Subtle glow behind frankie -->
            <div class="absolute inset-0 bg-purple-300/20 rounded-full blur-2xl scale-110"></div>
            <img src={OgImageWeb.Layouts.image_to_base64_url("frankie.webp")} alt="Frankie" class="relative w-auto" style="mix-blend-mode: multiply; height: 22rem;" />
          </div>
        </div>
      </div>
    </body>
    """
  end

  # Helper function to determine text size based on length
  def get_text_size(text) when is_binary(text) do
    length = String.length(text)
    
    cond do
      length <= 15 -> "text-[4.5rem]"    # Short text: large size
      length <= 25 -> "text-[3.8rem]"    # Medium text: medium-large size
      length <= 35 -> "text-[3.2rem]"    # Long text: medium size
      length <= 50 -> "text-[2.6rem]"    # Very long text: smaller size
      length <= 75 -> "text-[2.2rem]"    # Extra long text: much smaller size
      true -> "text-[1.8rem]"            # Super long text: smallest size
    end
  end
  
  def get_text_size(_), do: "text-[4.5rem]"  # Fallback for non-binary values
  
  # Helper function to clip text based on word count
  def clip_text(text, max_words \\ 5)
  
  def clip_text(text, max_words) when is_binary(text) do
    words = String.split(text, " ", trim: true)
    
    if length(words) > max_words do
      words
      |> Enum.take(max_words)
      |> Enum.join(" ")
      |> Kernel.<>("...")
    else
      text
    end
  end
  
  def clip_text(text, _), do: text  # Fallback for non-binary values

  @doc """
  A logo and text for Sprites on a dark background with halftone pattern.
  """
  def sprites_halftone(assigns) do
    ~H"""
    <body class="bg-sprites flex h-screen relative overflow-hidden">
      <!-- Violet halftone pattern layer - diagonal mask from top-right -->
      <div class="absolute inset-0 bg-violet-600" style="
        -webkit-mask-image: linear-gradient(15deg, rgba(0,0,0,0) 45%, rgba(0,0,0,1) 80%);
        mask-image: linear-gradient(15deg, rgba(0,0,0,0) 45%, rgba(0,0,0,1) 80%);
      ">
        <div class="absolute inset-0 bg-sprites-pattern"></div>
      </div>

      <!-- Subtle bottom glow -->
      <div class="absolute inset-0 bg-violet-600 opacity-10" style="
        -webkit-mask-image: linear-gradient(15deg, rgba(0,0,0,1), rgba(0,0,0,0) 50%);
        mask-image: linear-gradient(15deg, rgba(0,0,0,1), rgba(0,0,0,0) 50%);
      ">
        <div class="absolute inset-0 bg-sprites-pattern"></div>
      </div>

      <!-- Noise texture overlay -->
      <div class="absolute inset-0 bg-sprites-noise mix-blend-overlay opacity-30 pointer-events-none"></div>

      <!-- Main content area -->
      <div class="flex-1 flex items-center px-20 relative z-10">
        <!-- Text section -->
        <div class="flex-1">
          <!-- Logo -->
          <div class="mb-8 flex items-center gap-4">
            <svg class="relative top-px w-auto h-12" viewBox="0 0 724 582" fill-rule="evenodd">
              <g>
                <path d="M205.594 197.898h322.661v108.263H205.594z" fill="#ad47ff" />
                <path
                  d="M578.582 508.799h-72.323v72.686h72.323v-72.686zm-361.614 0h-72.323v72.686h72.323v-72.686zm361.614-290.742h72.323v145.371h-72.323v72.686h-74.229 1.906v72.685H216.968v-72.685h-72.323v-72.686H72.323V218.057h72.322v-73.163h72.323V72.686h72.323v72.685h144.645V72.686h72.323v72.685h72.323v72.686zM72.323 508.799V363.428H0v145.371h72.323zm650.904 0V363.428h-72.322v145.371h72.322zM289.423 290.742h-.132.132zm-72.455-72.685h72.323v72.685h-72.323v-72.685zm216.968 0h72.323v72.685h-72.323v-72.685zM578.582 0h-72.323v72.686h72.323V0zM216.968 0h-72.323v72.686h72.323V0z"
                  fill="#ad47ff"
                />
                <path
                  d="M144.645 363.428V218.057h72.323v-72.686h289.291v72.686h72.323v72.685l-.001.001v72.685h-72.322v72.686h-72.323V508.8H289.291v-72.686h-72.323v-72.686h-72.323zm144.646-72.686h-72.323v-72.685h72.323v72.685zm216.968 0h-72.323v-72.685h72.323v72.685z"
                  fill="#c27bff"
                />
              </g>
            </svg>
            <span class="font-sprites-heading text-white text-3xl font-medium tracking-[-0.01em]">Sprites</span>
          </div>
          <%
            # Extract string from {:safe, text} tuple if needed
            raw_text = case @text do
              {:safe, text} -> text
              text when is_binary(text) -> text
              _ -> to_string(@text)
            end
            clipped_text = OgImageWeb.ImageHTML.clip_text(raw_text, 20)
            text_size_class = OgImageWeb.ImageHTML.get_sprites_text_size(clipped_text)
          %>
          <h1 class={"font-sprites-heading text-[#c27bff] leading-[1.15] tracking-[-0.02em] break-words max-w-4xl #{text_size_class}"} style="font-weight: 500;">
            <%= clipped_text %>
          </h1>
        </div>
      </div>
    </body>
    """
  end

  # -- Shared Sprites building blocks ----------------------------------------

  @doc "Pixel-invader Sprites mark. Pass fills to recolour for light/dark backgrounds."
  attr :class, :string, default: "w-16 h-16"
  attr :fill, :string, default: "#c084fc"
  attr :fill_accent, :string, default: "#c084fc"
  attr :fill_inner, :string, default: "#e0c9ff"

  def sprites_mark(assigns) do
    ~H"""
    <svg class={@class} viewBox="0 0 724 582" fill-rule="evenodd" aria-hidden="true">
      <path d="M205.594 197.898h322.661v108.263H205.594z" fill={@fill} />
      <path
        d="M578.582 508.799h-72.323v72.686h72.323v-72.686zm-361.614 0h-72.323v72.686h72.323v-72.686zm361.614-290.742h72.323v145.371h-72.323v72.686h-74.229 1.906v72.685H216.968v-72.685h-72.323v-72.686H72.323V218.057h72.322v-73.163h72.323V72.686h72.323v72.685h144.645V72.686h72.323v72.685h72.323v72.686zM72.323 508.799V363.428H0v145.371h72.323zm650.904 0V363.428h-72.322v145.371h72.322zM289.423 290.742h-.132.132zm-72.455-72.685h72.323v72.685h-72.323v-72.685zm216.968 0h72.323v72.685h-72.323v-72.685zM578.582 0h-72.323v72.686h72.323V0zM216.968 0h-72.323v72.686h72.323V0z"
        fill={@fill_accent}
      />
      <path
        d="M144.645 363.428V218.057h72.323v-72.686h289.291v72.686h72.323v72.685l-.001.001v72.685h-72.322v72.686h-72.323V508.8H289.291v-72.686h-72.323v-72.686h-72.323zm144.646-72.686h-72.323v-72.685h72.323v72.685zm216.968 0h-72.323v-72.685h72.323v72.685z"
        fill={@fill_inner}
      />
    </svg>
    """
  end

  @doc "The fly.io-docs brush-stroke underline, recoloured with the Sprites violet→teal gradient."
  attr :class, :string, default: "absolute -bottom-2 left-0 w-full h-5"
  attr :from, :string, default: "#8b5cf6"
  attr :to, :string, default: "#2ee6a1"

  def sprites_underline(assigns) do
    ~H"""
    <svg viewBox="0 0 1213 73" aria-hidden="true" preserveAspectRatio="none" height="22" class={@class}>
      <path
        fill="url(#sprites-underline-gradient)"
        d="M1213.19 35.377c2.37-13.011-22.95-10.753-31.04-14.087C1086.89 5.705 911.742 2.887 815.218 2.809c-78.003.231-155.966-1.833-233.961.481-57.545.429-114.885 6.164-172.419 7.383-121.164 5.39-242.94 10.751-362.507 32.199-12.356 3.286-25.614 4.255-37.332 9.401-29.507 22.983 27.103 20.15 39.468 17.234 357.956-47.703 362.767-46.261 636.452-50.97 121.033-2.508 241.892 6.658 428.341 19.243 4.74.404 8.98-4.032 8-8.788a942.105 942.105 0 0154.69 6.378c9.44 1.843 18.92 3.583 28.29 5.729 4.01.839 8.02-1.718 8.95-5.712v-.01z"
      />
      <defs>
        <linearGradient id="sprites-underline-gradient" gradientTransform="rotate(110)">
          <stop offset="5%" stop-color={@from} />
          <stop offset="95%" stop-color={@to} />
        </linearGradient>
      </defs>
    </svg>
    """
  end

  @doc "Dark install-command pill: `$ curl https://sprites.dev/install.sh | bash`."
  def sprites_install(assigns) do
    ~H"""
    <div
      class="inline-flex items-center gap-3 font-mono text-[1.125rem] tracking-[0.2px] whitespace-nowrap"
      style="background: rgba(11,6,22,0.80); border: 1px solid rgba(150,120,220,0.32); border-radius: 13px; padding: 0.9rem 1.5rem; box-shadow: 0 10px 34px rgba(0,0,0,0.42);"
    >
      <span class="font-semibold text-[#34e0a1]">$</span>
      <span class="text-[#ece4ff]">curl https://sprites.dev/install.sh | bash</span>
    </div>
    """
  end

  @doc """
  Primary Sprites template — the noir "split": text zone on the left over a
  left-to-right darkening of the detective artwork, full lockup + install.
  """
  def sprites(assigns) do
    ~H"""
    <body class="bg-[#0a0713] flex h-screen relative overflow-hidden">
      <div class="bg-sprites-footer absolute inset-0"></div>
      <!-- Left-to-right darkening keeps the text zone legible over the artwork -->
      <div class="absolute inset-0" style="
        background: linear-gradient(90deg, rgba(8,5,16,0.96) 0%, rgba(8,5,16,0.90) 30%, rgba(8,5,16,0.45) 50%, rgba(8,5,16,0) 66%);
      "></div>

      <div class="absolute inset-y-0 left-0 flex flex-col justify-center" style="padding: 0 4.5rem;">
        <div class="flex items-center gap-4" style="margin-bottom: 2.5rem;">
          <.sprites_mark class="w-14 h-14" />
          <span class="font-mono font-semibold text-[2.25rem] tracking-[0.5px] text-[#f6f2ff]">Sprites</span>
        </div>
        <h1 class="relative inline-block font-bold text-[#f7f4ff] leading-[1.04] tracking-[-1.5px] text-[4rem] whitespace-nowrap">
          Stateful sandboxes
          <.sprites_underline />
        </h1>
        <div class="italic text-[#c6b4ee] leading-[1.1] tracking-[-0.5px] text-[2.1rem] whitespace-nowrap" style="margin-top: 1.75rem;">
          with checkpoint &amp; restore.
        </div>
        <div style="margin-top: 2.75rem;">
          <.sprites_install />
        </div>
      </div>
    </body>
    """
  end

  @doc """
  docs.sprites.dev template — mirrors the fly.io/docs layout (underlined URL
  label + dynamic page-title headline) on the noir split artwork. Honours the
  `text` param as the page title.
  """
  def sprites_docs(assigns) do
    ~H"""
    <body class="bg-[#0a0713] flex h-screen relative overflow-hidden">
      <div class="bg-sprites-footer absolute inset-0" style="background-position: 58% center;"></div>
      <!-- Left-to-right darkening keeps the text zone legible over the artwork -->
      <div class="absolute inset-0" style="
        background: linear-gradient(90deg, rgba(8,5,16,0.97) 0%, rgba(8,5,16,0.92) 34%, rgba(8,5,16,0.52) 52%, rgba(8,5,16,0.06) 70%);
      "></div>

      <!-- Logo above the page title (like the main template) -->
      <div class="absolute inset-y-0 left-0 flex flex-col justify-center" style="padding: 0 4.5rem; max-width: 760px;">
        <div class="flex items-center gap-4" style="margin-bottom: 2rem;">
          <.sprites_mark class="w-12 h-12" />
          <span class="font-mono font-semibold text-[1.75rem] tracking-[0.3px] text-[#f6f2ff]">Sprites</span>
        </div>
        <%
          # Extract string from {:safe, text} tuple if needed
          raw_text = case @text do
            {:safe, text} -> text
            text when is_binary(text) -> text
            _ -> to_string(@text)
          end
          clipped_text = OgImageWeb.ImageHTML.clip_text(raw_text, 20)
          text_size_class = OgImageWeb.ImageHTML.get_sprites_text_size(clipped_text)
        %>
        <h1 class={"font-bold text-[#f7f4ff] leading-[1.08] tracking-[-1px] break-words #{text_size_class}"}>
          <%= clipped_text %>
        </h1>
      </div>

      <!-- Footer: underlined docs.sprites.dev -->
      <div class="absolute" style="left: 4.5rem; bottom: 3rem;">
        <span class="relative inline-block font-mono font-semibold text-[1.4rem] tracking-[0.3px] text-[#c6b4ee]">
          docs.sprites.dev
          <.sprites_underline class="absolute -bottom-1 left-0 w-full h-2" />
        </span>
      </div>
    </body>
    """
  end

  # Helper function to determine text size for sprites template
  def get_sprites_text_size(text) when is_binary(text) do
    length = String.length(text)

    cond do
      length <= 20 -> "text-[4.5rem]"
      length <= 35 -> "text-[3.8rem]"
      length <= 50 -> "text-[3.2rem]"
      length <= 75 -> "text-[2.6rem]"
      length <= 100 -> "text-[2.2rem]"
      true -> "text-[1.8rem]"
    end
  end

  def get_sprites_text_size(_), do: "text-[4.5rem]"

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
