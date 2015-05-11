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