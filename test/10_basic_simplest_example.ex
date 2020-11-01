defmodule Examples.Schemas.Basic.Simplest do
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.EctoClassic

  def create_test_data do 
    start(
      module_under_test: Basic,
      format: :phoenix
    ) |> 

    category(                                         :validation_success,
      ok: [
        params(
          age: 1,
          date: "2001-01-01")
      ]) |> 

    category(                                         :validation_error,
      invalid: [
        params(
          age: "32a",
          date: "2001-1-1"),
      ],
      empty: [
        params(
          age: "",
          date: ""),
      ],
      missing: [params()]
    )      
  end
end

