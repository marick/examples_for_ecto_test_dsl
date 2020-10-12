defmodule Examples.Schemas.Named do
  alias App.Schemas.Named, as: Named
  use TransformerTestSupport.Variants.Changeset

  def create_test_data do 
    start(
      module_under_test: Named,
      format: :phoenix
    ) |>

    category(                                         :valid,
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

