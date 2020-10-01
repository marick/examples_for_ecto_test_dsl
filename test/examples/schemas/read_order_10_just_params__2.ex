defmodule Examples.Schemas.Basic.JustParams__2 do
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.Changeset__2


  def create_test_data() do
    start(
      module_under_test: Basic,
      param_type: :http
    )

    category(                                         :valid,
      ok: [params: %{age: 1, date: "2001-01-01"}
          ])

    category(                                         :invalid,
      bad_date: [params: %{age: 1, date: "2001-1-1"}
                ])
  end
end

