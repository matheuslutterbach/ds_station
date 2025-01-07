defmodule DsStation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DsStationWeb.Telemetry,
      DsStation.Repo,
      {DNSCluster, query: Application.get_env(:ds_station, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DsStation.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DsStation.Finch},
      # Start a worker by calling: DsStation.Worker.start_link(arg)
      # {DsStation.Worker, arg},
      # Start to serve requests, typically the last entry
      DsStationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DsStation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DsStationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
