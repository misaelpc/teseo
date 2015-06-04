defmodule Teseo.Repo do
  use Ecto.Repo,
  	otp_app: :teseo,
    adapter: Ecto.Adapters.Postgres
end