defmodule App.Schemas.Basic.ValidationTest do
  use ExUnit.Case, async: true
  alias Examples.Schemas.Basic.Validation.Tester

  test "first version" do 
    Tester.check_workflow(:ok)
    Tester.check_workflow(:bad_date)
  end

  # To check the examples in a single module:
  # This will generate one ExUnit `test` for each example.

  alias Examples.Schemas.Basic.Validation, as: Basic
  import TransformerTestSupport.Runner
  
  check_examples_with(Basic.Tester)
end
