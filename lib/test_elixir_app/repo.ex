defmodule TestElixirApp.Repo do
  use Ecto.Repo,
    otp_app: :test_elixir_app,
    adapter: Ecto.Adapters.Postgres
end
