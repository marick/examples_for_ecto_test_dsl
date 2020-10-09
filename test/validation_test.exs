defmodule App.Schemas.Basic.ValidationTest do
  use App.Case
  alias Examples.Schemas.Basic.Validation.Tester

  test "first version" do 
    Tester.validate(:ok)
    Tester.validate(:bad_date)
  end
end
