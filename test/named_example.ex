defmodule Examples.Schemas.Named do
  alias App.Schemas.Named, as: Named
  use TransformerTestSupport.Variants.EctoClassic

  def create_test_data do 
    start(
      module_under_test: Named,
      format: :phoenix
    )

    |> field_transformations(
      as_cast: [:name, :date_string, :lock_uuid],
      date: on_success(
        Date.from_iso8601!(:date_string)),
      days_since_2000: on_success(
        Date.diff(:date, ~D[2000-01-01])
    ))

    |> category(                                         :success,
      ok: [
        params(      name: "Bossie", date_string:   "2001-01-01"),
        changeset(
          changes: %{date: ~D[2001-01-01]}
        ),
      ]
    )

    |> category(                                         :validation_failure,
      format: [
        params_like(:ok, except: [date_string: "2001-01-0"]),
        changeset(
          no_changes: [:date, :days_since_2000],
          error: [date_string: "is not a valid date"]
        ),
      ],
    
      too_early: [
        params_like(:ok, except: [date_string: "1999-12-30"]),
        changeset(
          no_changes: [:days_since_2000],
          error: [date_string: "must be this century"]
        ),
      ]
    )
  end
end

