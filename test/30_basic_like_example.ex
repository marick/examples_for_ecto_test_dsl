defmodule Examples.Schemas.Basic.Like do
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.Changeset

  def create_test_data do 
    start(
      module_under_test: Basic,
      format: :phoenix,
      variant: Changeset
    ) |> 

    category(                                         :valid,
      ok: [
        params(      age: 1, date:   "2001-01-01"),
        changeset(
          changes: %{age: 1, date: ~D[2001-01-01]}
        )]
    ) |> 
    
    category(                                         :invalid,
      bad_date: [
        params_like(:ok, except: [date: "2001-1-1"]),
        changeset(
          no_changes: [:date],
          errors: [date: ~r/invalid/]
        )]
    ) 
  end
end

