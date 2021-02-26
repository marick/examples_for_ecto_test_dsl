defmodule Examples.OneExampleTest do
  use App.EctoCase, async: true

  test "one" do 
    alias Examples.Schemas20.Update.Animal.Tester
    Tester.check_workflow(:add_note_to_animal, trace: true)
  end
end
