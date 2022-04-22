defmodule FoodTruckUs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FoodTruckUs.Repo,
      # Start the Telemetry supervisor
      FoodTruckUsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FoodTruckUs.PubSub},
      # Start the Endpoint (http/https)
      FoodTruckUsWeb.Endpoint
      # Start a worker by calling: FoodTruckUs.Worker.start_link(arg)
      # {FoodTruckUs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodTruckUs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodTruckUsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
