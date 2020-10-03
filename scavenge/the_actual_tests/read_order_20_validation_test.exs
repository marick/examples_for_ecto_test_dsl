defmodule App.Schemas.Basic.ValidationTest__2 do
  use App.Case
  alias Examples.Schemas.Basic.Validation__2, as: Params

  test "first version" do 
    Params.validate(:ok)
    Params.validate(:bad_date)
  end

  @tag :skip
  test "second version" do 
    # Params.check_everything
  end
  
end
