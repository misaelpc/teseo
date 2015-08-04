defmodule Teseo.Repo.Migrations.TeseoError do
  use Ecto.Migration

  def change do
    create table(:teseo_error) do
      add :code, :string
      add :stage, :string
      add :message, :text
      add :level, :int
      add :request_headers, :text
      add :http_code, :string
      add :client_id, :string #id del cliente
      add :user_id, :string #id del usuario
      add :request_body, :text
      add :error_details, :text # as json
      timestamps
    end
  end

  def up do
    alter table(:teseo_error) do
      add :request_url,    :text
      add :transaction_id, :string
    end
  end

  def down do
    drop table(:teseo_error)
  end
end
