defmodule Examples.OneExampleTest do
  use App.EctoCase, async: true

  test "first version" do 
    alias Examples.Schemas10.Named.Insert.Tester
    Tester.check_workflow(:bossie, trace: true)
  end
end
