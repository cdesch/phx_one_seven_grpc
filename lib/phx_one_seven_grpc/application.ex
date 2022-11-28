defmodule PhxOneSevenGrpc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxOneSevenGrpcWeb.Telemetry,
      # Start the Ecto repository
      PhxOneSevenGrpc.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxOneSevenGrpc.PubSub},
      # Start Finch
      {Finch, name: PhxOneSevenGrpc.Finch},
      # Start the Endpoint (http/https)
      PhxOneSevenGrpcWeb.Endpoint,
      # Start a worker by calling: PhxOneSevenGrpc.Worker.start_link(arg)
      # {PhxOneSevenGrpc.Worker, arg}
      # {GRPC.Server.Supervisor, endpoint: Helloworld.Endpoint, port: 50051, start_server: true}
      {GRPC.Server.Supervisor, endpoint: Helloworld.Endpoint, port: 50051}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxOneSevenGrpc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxOneSevenGrpcWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
