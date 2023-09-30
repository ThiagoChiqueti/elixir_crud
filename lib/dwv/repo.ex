defmodule Dwv.Repo do
  use Ecto.Repo,
    otp_app: :dwv,
    adapter: Ecto.Adapters.Postgres
end
