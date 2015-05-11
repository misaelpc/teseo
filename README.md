Teseo
=====

## Centralized Error Application 

#### Add to your mix.exs

##### As erlang application

```
def application do
    [mod: {Hades, []},
     applications: [:phoenix, :cowboy, :logger,:teseo]]
  end
```

##### As dependency
```
defp deps do
    [{:phoenix, "~> 0.11.0"},
     {:cowboy, "~> 1.0"},
     {:ecto, "~> 0.10.2"},
     {:postgrex, "~> 0.8"},
     {:phoenix_live_reload, "~> 0.3.0"},
     {:teseo, git: "https://github.com/misaelpc/teseo.git"}]
  end
```

##### Add Teso repo configuration to your dev.exs file

```
config :teseo, Teseo.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "teseo_db",
  username: "misaelperezchamorro",
  password: "",
  hostname: "localhost"  

config :teseo, :stage_error_messages,
  schema_validation: "Comprobante no valido, no cumple con el esquema",
  routing: "No es posible rutear el documento con los elementos contenidos en el request"

config :teseo, :stage_http_codes,
  schema_validation: 400,
  routing: 400

config :teseo, :internal_codes,
  schema_validation: 1800,
  routing: 1800
```

#### Run Teseo Tasks

```
$ mix teseo.setup.db
```



#### Run Ecto Migrations

```
$ mix ecto.create -r --Teseo.Repo
$ mix ecto.migrate -r --Teseo.Repo
```
