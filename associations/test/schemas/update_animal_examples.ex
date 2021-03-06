 defmodule Examples.Update.Animal do
  alias App.Schemas
  alias Examples.Insert

  use EctoTestDSL.Variants.PhoenixGranular.Update
  
  
  def create_test_data do
    note_free_animal = een(note_free: Insert.Animal)
    
    start(
      api_module: Schemas.Animal,
      schema: Schemas.Animal,
      repo: App.Repo,
      usually_ignore: [:lock_uuid, :inserted_at, :updated_at]
    )

    workflow(                                              :success,
      add_note_to_animal: [
        params_from(note_free_animal, except: [notes: "gelding"]),
        changeset(changes: [notes: "gelding"]),
        result_matches(note_free_animal, except: [notes: "gelding"]),
        run: :skip
      ]
    #   # add_note_better: [
    #   #   assert_update(note_free, notes: "gelding")
    #   # ]
    )

    # |> workflow(                                         :constraint_error,
    #   duplicate: [
    #     assert_selected(@note_free, name: "Bossie")
    #     params_selected(@note_free, except: [name: "Bossie"])
    #     changeset(changes: [name: "Bossie"])
    #     constraint_changeset(error: [name: "has already been taken"])
    #   ],

    # duplicate_better: [
    #   constraint_error_update(@note_free, name: "Bossie")
    # ]
    # )
  end
end

