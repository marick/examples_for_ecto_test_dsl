defmodule App.Schemas.Basic.SimplestParamsTest do
  use App.Case
  alias App.Schemas.Basic, as: Schema
  alias Examples.Schemas.Basic.Simplest.Tester

  # shell$ MIX_ENV=test iex -S mix
  # iex> TransformerTestSupport.start
  # iex> alias Examples.Schemas.Basic.SimplestParams.Tester
  # iex> Tester.params(:ok)
  # %{"age" => "1", "date" => "2001-01-01"}

  test "valid dates are accepted" do
    Schema.changeset(%Schema{}, Tester.params(:ok))
    |> assert_valid
    |> assert_changes(age: 1,
                      date: ~D[2001-01-01])
  end

  test "invalid inputs" do
    Schema.changeset(%Schema{}, Tester.params(:invalid))
    |> assert_invalid
    |> assert_errors(date: "is invalid",
                     age: "is invalid")
  end


  test "empty inputs" do
    Schema.changeset(%Schema{}, Tester.params(:empty))
    |> assert_invalid
    |> assert_errors(date: "can't be blank",
                     age: "can't be blank")
  end


  test "missing inputs" do
    Schema.changeset(%Schema{}, Tester.params(:missing))
    |> assert_invalid
    |> assert_errors(date: "can't be blank",
                     age: "can't be blank")
  end
end
