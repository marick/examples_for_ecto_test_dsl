defmodule Examples.Schemas20.Insert.Note do
  alias App.Schemas20, as: Schemas

  use EctoTestDSL.Variants.PhoenixGranular.Insert

  def create_test_data do 
    start(
      module_under_test: Schemas.Note,
      repo: App.Repo
    ) |> 

    field_transformations(
      as_cast: [:id, :text, :animal_id] ) 
#      date: on_success(Date.utc_today, stubbed: ~D[2001-01-02])) |> 

    workflow(                                         :validation_success,
      note: [
                params(text: "note text", animal_id: 33)
                ]
    ) 

    workflow(                                         :validation_error,
      empty: [params(text: ""),
              changeset(
                no_changes: [:text],
                error: [text: "can't be blank"]),
             ]
    )
  end
end

