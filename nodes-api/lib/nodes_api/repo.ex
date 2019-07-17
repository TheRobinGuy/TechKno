defmodule NodesApi.Repo do
  use Ecto.Repo,
    otp_app: :nodes_api,
    adapter: Ecto.Adapters.Postgres
end
