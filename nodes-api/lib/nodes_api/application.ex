defmodule NodesApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      NodesApi.Repo,
      # Start the endpoint when the application starts
      NodesApiWeb.Endpoint
      # Starts a worker by calling: NodesApi.Worker.start_link(arg)
      # {NodesApi.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NodesApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NodesApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
