defmodule Examples.Schemas.Named.VirtualField do
  alias App.Schemas.Named, as: Named
  use TransformerTestSupport.Variants.Changeset

  build(
    module_under_test: Named,
    examples: [
      # -------------------------------------------VALID-------------------
      ok: %{
        params: to_strings(
          name: "Bossie",
          lock_version: 1,
          date_string: "2001-01-01"),
        changeset: [
          changes: [date: ~D[2001-01-01]]
        ],
        categories: [:valid]
      },
      # -----------------------------------------INVALID-------------------

      bad_validations: %{
        params: like(:ok, except: [name: "", date_string: "ump"]),
        changeset: [
          no_changes: [:name, :date],
          changes: [date_string: "ump"],
          errors: [name: "can't be blank",
                   date_string: "is not a valid date"]
        ],
        categories: [:invalid]
      }
    ])
      
end
