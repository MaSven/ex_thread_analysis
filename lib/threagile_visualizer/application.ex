defmodule ThreagileVisualizer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ThreagileVisualizerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ThreagileVisualizer.PubSub},
      # Start the Endpoint (http/https)
      ThreagileVisualizerWeb.Endpoint
      # Start a worker by calling: ThreagileVisualizer.Worker.start_link(arg)
      # {ThreagileVisualizer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ThreagileVisualizer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThreagileVisualizerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
