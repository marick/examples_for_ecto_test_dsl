defmodule Examples.Schemas.Basic.FieldDescription do
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.EctoClassic
  require TransformerTestSupport.Impl.Build

  def create_test_data do

    start(
      module_under_test: Basic,
      format: :phoenix
    ) |>

    field_transformations(Basic,
      age: :as_cast,
      date: {Date, :from_iso8601!, [:date]}
    ) |> 

    category(                                         :valid,
      ok: [
        params(age: 1, date:   "2001-01-01"),
      ]) |> 
    
    category(                                         :invalid,
      bad_date: [
        params_like(:ok, except: [date: "2001-1-1"]),
        changeset(
          no_changes: [:date],
          errors: [date: ~r/invalid/]
        ),
      ])
  end
end

