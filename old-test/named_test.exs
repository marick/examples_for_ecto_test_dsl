defmodule App.Schemas.NamedTest do
  use App.EctoCase, async: true
  alias Examples.Schemas.Named.Tester
  import EctoTestDSL.Runner

  test "just show separate tests yet again" do 
    Tester.check_workflow(:ok)
  end

  test "and yet again" do 
    Tester.check_workflow(:duplicate_name)
  end

  check_examples_with(Tester)
end
