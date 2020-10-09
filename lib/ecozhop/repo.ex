defmodule Ecozhop.Repo do
  use Ecto.Repo,
    otp_app: :ecozhop,
    adapter: Ecto.Adapters.Postgres
end
