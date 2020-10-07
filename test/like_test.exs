defmodule App.Schemas.Basic.LikeTest do
  use App.Case
  alias Examples.Schemas.Basic.Like, as: Params

  test "it all" do 
    Params.check_everything
  end
  
end
