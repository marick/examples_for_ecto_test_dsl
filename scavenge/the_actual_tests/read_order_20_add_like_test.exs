defmodule App.Schemas.Basic.AddLikeTest do
  use App.Case
  alias App.Schemas.Basic, as: Schema
  alias Examples.Schemas.Basic.AddLike, as: Params

  test "valid dates are accepted" do
    Schema.changeset(%Schema{}, Params.get_params(:ok))
    |> assert_valid
    |> assert_changes(age: 1,
                      date: ~D[2001-01-01])
  end

  test "invalid dates are rejected" do
    Schema.changeset(%Schema{}, Params.get_params(:error))
    |> assert_invalid
    |> assert_error(date: "is invalid")
  end
end
