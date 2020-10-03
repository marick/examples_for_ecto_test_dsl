defmodule App.Schemas.Basic.ValidationTest do
  use App.Case
  alias Examples.Schemas.Basic.Validation, as: Params

  describe "first version" do 
    test "valid dates are accepted" do
      Params.accept_example(:ok)
      |> assert_valid
      |> assert_changes(age: 1,
      date: ~D[2001-01-01])
    end
    
    test "invalid dates are rejected" do
      Params.accept_example(:error)
      |> assert_invalid
      |> assert_error(date: "is invalid")
    end
  end

  test "second version" do 
    Params.validate_example(:ok)
    Params.validate_example(:error)
  end

  test "third version" do 
    Params.validate_category(:valid)
    Params.validate_categories([:invalid])
  end
  
end
