defmodule App.Schemas.AllSchemasTest do
  use ExUnit.Case, async: true
  import EctoTestDSL.Runner

  # To check a bunch of examples in a bunch of files.
  # This will generate one ExUnit `test` for each example.

  check_examples_in_files("test/*example.ex")
end

