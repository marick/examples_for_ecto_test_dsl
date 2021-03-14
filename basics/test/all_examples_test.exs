defmodule Example.AllExamplesTest do
  use ExUnit.Case, async: true
  import EctoTestDSL.Runner

  # To check a bunch of examples in a bunch of files.
  # This will generate one ExUnit `test` for each example.
  # You can add `show_names: true` to see which examples are being checked.

  check_examples_in_files("test/*/*examples.ex")
end

