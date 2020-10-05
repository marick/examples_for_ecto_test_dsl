defmodule App.Schemas.Basic.ValidationTest do
  use App.Case
  alias Examples.Schemas.Basic.Validation, as: Params

  test "first version" do 
    Params.validate(:ok)
    Params.validate(:bad_date)
  end

  test "second version" do 
    Params.check_everything
  end
  
end
