defmodule App.EctoCase do

  use ExUnit.CaseTemplate

  using do
    quote do
      use App.Case
    end
  end
      
  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(App.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(App.Repo, {:shared, self()})
    end

    :ok
  end
end
