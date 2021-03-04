defmodule Examples.Schemas20.Insert.Animal do
  alias App.Schemas20, as: Schemas
  alias Examples.Schemas20.Insert

  use EctoTestDSL.Variants.PhoenixGranular.Insert
  
  def create_test_data do 
    start(
      module_under_test: Schemas.Animal,
      repo: App.Repo
    ) |>

    field_transformations(
      as_cast: [:name, :lock_uuid, :species_id]
    ) |>

    workflow(                                              :success,
      note_free: [params(name: "Bossie",
                         notes: [],
                         species_id: id_of(bovine: Insert.Species))
                 ],

      with_notes: [params_like(:note_free, except:
                      [notes: [params_like(:note_free)]]),
                  run: :skip]

#                                  %{text: "gelding"}]])]
    )

    |> workflow(                                         :constraint_error,
       duplicate_name: [
         insert_twice(:note_free),
         # NOTE that constraint changeset should only check the errors,
         # not the ones created from field transformations.
         # That's because the other changeset fields may be surprising.
         # For example, consider a changeset for a field like
         #       field :notes, :string, default: "<no notes>"
         #
         # Upon inserting it with the return value being a constraint error,
         # you'll get notes: "<no notes>" in the changes and the data parts
         # of the changeset, but you'll only get it in the data part if
         # there's no default.
         #    
         constraint_changeset(error: [name: "has already been taken"])
       ]
    )
  end
end

