defmodule Examples.Schemas.Species do
  alias App.Schemas.Species
  use TransformerTestSupport.Variants.EctoClassic

  def create_test_data do 
    start(
      module_under_test: Species,
      format: :phoenix,
      repo: App.Repo
    )

    |> field_transformations(as_cast: [:id, :name])

    |> category(                                         :success,
      bovine: [params(name: "bovine")],
      equine: [params(name: "equine")]
    )

    |> category(                                         :validation_error,
      empty: [params(),
              changeset(
                no_changes: [:name],
                error: [name: "can't be blank"])]
    )

    |> category(                                         :constraint_error,
       duplicate_name: [
         insert_twice(:bovine),
         constraint_changeset(error: [name: "has already been taken"])
       ]
    )
  end
end

