defmodule Examples.Schemas.Named do
  alias App.Schemas.Named, as: Named
  use TransformerTestSupport.Variants.EctoClassic

  def create_test_data do 
    start(
      module_under_test: Named,
      format: :phoenix
    ) |>

    field_transformations(
      as_cast: [:name, :date_string, :lock_version],
      date: on_success(&Date.from_iso8601!/1, applied_to: :date_string)
    ) |> 

    category(                                         :success,
      ok: [
        params(      name: "Bossie", date_string:   "2001-01-01"),
        changeset(
          changes: %{date: ~D[2001-01-01]}
        ),
        round_trip: [:name, :date]
      ]
      )
  end
end

