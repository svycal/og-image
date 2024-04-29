defmodule OgImage.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OgImageWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:og_image, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: OgImage.PubSub},
      # Start a worker by calling: OgImage.Worker.start_link(arg)
      # {OgImage.Worker, arg},
      # Start to serve requests, typically the last entry
      OgImageWeb.Endpoint,
      # NodeJS processes
      {NodeJS.Supervisor,
       path: Path.join([Application.app_dir(:og_image), "priv/js"]), pool_size: 4}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OgImage.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OgImageWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
