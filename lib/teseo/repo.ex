defmodule Teseo.Repo do
  use Ecto.Repo, 
  	otp_app: :teseo,
  	database: "teseo_db"
end