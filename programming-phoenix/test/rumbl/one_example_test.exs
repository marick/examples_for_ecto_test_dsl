defmodule Examples.OneExampleTest do
  use Rumbl.DataCase, async: true

  test "one" do 
    alias Examples.Insert.Account.Tester
    Tester.check_workflow(:unique, trace: true)
  end
end
