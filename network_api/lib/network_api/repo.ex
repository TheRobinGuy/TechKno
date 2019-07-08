defmodule NetworkApi.Repo do
  use Ecto.Repo,
    otp_app: :network_api,
    adapter: Ecto.Adapters.Postgres
end
