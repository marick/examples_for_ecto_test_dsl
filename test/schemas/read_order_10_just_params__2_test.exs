defmodule App.Schemas.Basic.JustParams__2Test do
  use App.Case
  alias App.Schemas.Basic, as: Schema
  alias Examples.Schemas.Basic.JustParams__2, as: Params

  test "valid dates are accepted" do
    Schema.changeset(%Schema{}, Params.params(:ok))
    |> assert_valid
    |> assert_changes(age: 1,
                      date: ~D[2001-01-01])
  end

  @tag :skip
  test "invalid dates are rejected" do
    Schema.changeset(%Schema{}, Params.params(:error))
    |> assert_invalid
    |> assert_error(date: "is invalid")
  end
end
