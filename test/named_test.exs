defmodule App.Schemas.NamedTest do
  use App.EctoCase
  alias Examples.Schemas.Named.Tester
  alias App.Schemas.Named, as: Named
  


  test "first version" do 
    {:ok, %{id: id}} = Tester.validate(:ok) |> App.Repo.insert
    App.Repo.get(Named, id)
    |> assert_fields(name: "Bossie", date: ~D[2001-01-01])
  end
  
end
