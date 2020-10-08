defmodule App.Schemas.Basic.JustParamsTest do
  use App.Case
  alias App.Schemas.Basic, as: Schema
  alias Examples.Schemas.Basic.JustParams.Tester

  # shell$ MIX_ENV=test iex -S mix
  # iex> TransformerTestSupport.start
  # iex> alias Examples.Schemas.Basic.JustParams.Tester
  # iex> Tester.params(:ok)
  # %{"age" => "1", "date" => "2001-01-01"}

  test "valid dates are accepted" do
    Schema.changeset(%Schema{}, Tester.params(:ok))
    |> assert_valid
    |> assert_changes(age: 1,
                      date: ~D[2001-01-01])
  end

  test "invalid dates are rejected" do
    Schema.changeset(%Schema{}, Tester.params(:bad_date))
    |> assert_invalid
    |> assert_error(date: "is invalid")
  end
end
