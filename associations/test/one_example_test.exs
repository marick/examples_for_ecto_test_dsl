defmodule Examples.OneExampleTest do
  use App.EctoCase, async: true

  test "one" do 
    # alias Examples.Schemas20.Insert.Animal.Tester
    alias Examples.Insert.Animal.Tester

    
   Tester.params(:with_notes_2) |> IO.inspect
#    Tester.check_workflow(:with_notes, trace: true)
  end

end
