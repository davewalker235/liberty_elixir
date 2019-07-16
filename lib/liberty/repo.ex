defmodule Liberty.Repo do
  use Ecto.Repo,
    otp_app: :liberty,
    adapter: Ecto.Adapters.Postgres
end
