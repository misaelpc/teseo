defmodule Mix.Tasks.Teseo do
  defmodule Setup.Db do
    use Mix.Task
    import Mix.Generator
    import Mix.Utils, only: [camelize: 1, underscore: 1]

    @shortdoc "Teseo Setup DataBase"

    @moduledoc """ 
      A task for generating model struct, its database migration and Repo if one does not yet exist.
    """

    def run(_args) do
      _app_name = Mix.Project.config[:app]
      _project_module_name = camelize(to_string(Mix.Project.config[:app]))

      generate_migration_file()
    end

    defp generate_migration_file() do
      path = Path.join(System.cwd(), "/priv/repo/migrations")
      migration_file = Path.join(path, "#{timestamp}_create_teseo_error.exs")

      create_file migration_file, migration_template(mod: "lol")
    end

    defp timestamp do
      { {y, m, d}, {hh, mm, ss} } = :calendar.universal_time()
      "#{y}#{pad(m)}#{pad(d)}#{pad(hh)}#{pad(mm)}#{pad(ss)}"
    end

    defp pad(i) when i < 10, do: << ?0, ?0 + i >>
    defp pad(i), do: to_string(i)

    embed_template :migration, """
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
    """
  end
end