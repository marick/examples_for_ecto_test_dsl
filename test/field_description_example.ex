defmodule Examples.Schemas.Basic.FieldDescription do
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.EctoClassic

  def create_test_data do
    start(
      module_under_test: Basic,
      format: :phoenix
    ) |>

    field_transformations(as_cast: [:age, :date]) |> 

    category(                                         :success,
      ok: [
        params(age: 1, date:   "2001-01-01"),
      ]) |> 
    
    category(                                         :validation_failure,
      bad_date: [
        params_like(:ok, except: [date: "2001-1-1"]),
      ])
  end
end

