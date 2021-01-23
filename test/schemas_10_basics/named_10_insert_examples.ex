defmodule Examples.Schemas10.Named.Insert do
  alias App.Schemas10.Named, as: Named
  use TransformerTestSupport.Variants.PhoenixClassic.Insert

  def create_test_data do 
    start(
      module_under_test: Named,
      repo: App.Repo
    ) |>

    workflow(                                         :success,
      bossie: [
        params(name: "Bossie", age: 10, date_string: "2000-01-10"),
        changeset(changes: [
                    name: "Bossie", age: 10, date_string: "2000-01-10",
                    date: ~D[2000-01-10], days_since_2000: 9])
      ]
    ) |>
    
    workflow(                                         :validation_error,
      bad_format: [
        params_like(:bossie, except: [date_string: "2001-01-0"]),
        changeset(
          no_changes: [:date, :days_since_2000],
          error: [date_string: "is not a valid date"]
        ),
      ]
    ) |>

    workflow(                                         :constraint_error,
      duplicate_name: [
        previously(insert: :bossie),
        params_like(:bossie),
        constraint_changeset(error: [name: "has already been taken"])
      ],

      duplicate_name_better: [
        insert_twice(:bossie),
        constraint_changeset(error: [name: "has already been taken"])
      ])
  end
end

