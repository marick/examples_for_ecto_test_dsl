defmodule App.Schemas.AllSchemasTest do
  use ExUnit.Case, async: true
  import TransformerTestSupport.Tester

  # To check a bunch of examples in a bunch of files.
  # This will generate one ExUnit `test` for each example.

  check_examples_in_files("test/*example.ex")

  # To check the examples in a single module:

  # check_examples_with(Examples.Schemas.Basic.Validation.Tester)

  # The above can't be uncompiled because it generates tests with
  # the same names as some of the `check_examples_in_files` tests.
  
end

