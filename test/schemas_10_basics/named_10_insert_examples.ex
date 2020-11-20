defmodule Examples.Schemas10.Named.Insert do
  alias App.Schemas10.Named, as: Named
  use TransformerTestSupport.Variants.EctoClassic

  def create_test_data do 
    start(
      module_under_test: Named,
      format: :phoenix,
      repo: App.Repo,
      action: :insert
    ) |>

    category(                                         :success,
      bossie: [
        params(name: "Bossie", age: 10, date_string: "2001-01-01"),
      ]
    ) |>
    
    category(                                         :validation_error,
      format: [
        params_like(:bossie, except: [date_string: "2001-01-0"]),
        changeset(
          no_changes: [:date, :days_since_2000],
          error: [date_string: "is not a valid date"]
        ),
      ]
    ) |>

    category(                                         :constraint_error,
      duplicate_name: [
        setup(insert: :bossie),
        params_like(:bossie),
        constraint_changeset(error: [name: "has already been taken"])
      ],

      duplicate_name_better: [
        insert_twice(:bossie),
        constraint_changeset(error: [name: "has already been taken"])
      ])
  end
end

