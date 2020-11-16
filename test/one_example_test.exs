defmodule App.OneExampleTest do
  use App.EctoCase, async: true

  test "first version" do 
    alias Examples.Schemas.Animal
     Animal.Tester.check_workflow(:duplicate_name)
  end
end
