defmodule App.Schemas.AllSchemasTest do
  use ExUnit.Case, async: true
  import TransformerTestSupport.Macros
  alias Examples.Schemas

  check_examples_with(Schemas.Basic.Simplest.Tester)
  check_examples_with(Schemas.Basic.Validation.Tester)
  check_examples_with(Schemas.Basic.Like.Tester)
end

