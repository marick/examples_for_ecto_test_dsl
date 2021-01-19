defmodule Examples.OneExampleTest do
  use App.EctoCase, async: true

  test "one" do 
    alias Examples.Schemas10.Named.Insert.Tester
    Tester.check_workflow(:bad_format, trace: false)
  end
end
