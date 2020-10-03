defmodule Examples.Schemas.Named.Constraints do
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
      duplicate_name: %{
        params: like(:ok)
      }
    ])
      
end
