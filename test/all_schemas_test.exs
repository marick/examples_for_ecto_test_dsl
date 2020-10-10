defmodule App.Schemas.AllSchemasTest do
  use ExUnit.Case, async: true
  import TransformerTestSupport.Macros

  @module_name_regex ~r/^.*defmodule[\s]+([.\w]+)/
  
  for path <- Path.wildcard("test/*example.ex") do
    first_line = File.open!(path, [:read]) |> IO.read(:line)

    case Regex.run(@module_name_regex, first_line) do
      [_all, module_name] ->
        module_name 
        |> Module.safe_concat("Tester")
        |> check_examples_with
      _ ->
        raise ~s/Could not find the module name inside file "#{path}"/
    end
  end
end

