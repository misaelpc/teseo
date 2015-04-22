defmodule Teseo do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    tree = [worker(Teseo.Repo, [])]
    opts = [name: :teseo_repo, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end
