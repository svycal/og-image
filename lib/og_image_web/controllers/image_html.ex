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
