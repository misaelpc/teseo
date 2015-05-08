defmodule Teseo.Repo.Migrations.TeseoError do
  use Ecto.Migration

  def up do
    create table(:teseo_error) do
      add :code, :string
      add :stage, :string
      add :message, :string
      add :request_headers, :string
      add :http_code, :string
      add :client_id, :string #id del cliente
      add :user_id, :string #id del usuario
      add :request_body, :string
      add :error_details, :string # as json
      timestamps
    end
  end

  def down do
    drop table(:teseo_error)
  end
end
