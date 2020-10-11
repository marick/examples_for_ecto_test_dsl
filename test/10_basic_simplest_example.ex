defmodule Examples.Schemas.Basic.Simplest do
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.Changeset

  def create_test_data do 
    start(
      module_under_test: Basic,
      format: :phoenix
    ) |> 

    category(                                         :valid,
      ok: [
        params(
          age: 1,
          date: "2001-01-01")
      ]) |> 

    category(                                         :invalid,
      bad_date: [
        params(
          age: 1,
          date: "2001-1-1"),
      ])
  end
end

