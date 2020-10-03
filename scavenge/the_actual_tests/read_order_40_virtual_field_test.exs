defmodule App.Schemas.Named.VirtualFieldTest do
  use App.Case
  alias Examples.Schemas.Named.VirtualField, as: Params

  test "current example" do
    Params.validate_example(:bad_validations)
  end
  
  test "validation" do 
    Params.validate_category(:valid)
    Params.validate_category(:invalid)
  end
  
end
