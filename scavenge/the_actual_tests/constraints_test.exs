defmodule App.Schemas.Named.ConstraintsTest do
  use App.EctoCase, async: true
  alias Examples.Schemas.Named.Constraints, as: Params
  alias App.Repo
  
  describe "first example" do 
    test "insertion works" do
      assert {:ok, _} = Params.validate_example(:ok) |> Repo.insert
    end

    test "double insertion" do
      changeset = Params.validate_example(:ok)
      
      Repo.insert(changeset) |> assert_ok
      Repo.insert(changeset)
      |> error_content
      |> assert_error(name: "has already been taken")
    end
  end
end
