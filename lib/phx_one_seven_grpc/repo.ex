defmodule PhxOneSevenGrpc.Repo do
  use Ecto.Repo,
    otp_app: :phx_one_seven_grpc,
    adapter: Ecto.Adapters.Postgres
end
