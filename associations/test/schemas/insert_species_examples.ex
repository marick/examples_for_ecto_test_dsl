defmodule Examples.Insert.Species do
  alias App.Schemas

  use EctoTestDSL.Variants.PhoenixGranular.Insert

  def create_test_data do 
    start(
      api_module: Schemas.Species,
      repo: App.Repo
    )

    field_transformations(as_cast: [:id, :name])

    workflow(                                         :success,
      bovine: [params(name: "bovine")],
      equine: [params(name: "equine")]
    )

    workflow(                                         :validation_error,
      empty: [params(),
              changeset(
                no_changes: [:name],
                error: [name: "can't be blank"])]
    )

    workflow(                                         :constraint_error,
       duplicate_name: [
         insert_twice(:bovine),
         constraint_changeset(error: [name: "has already been taken"])
       ]
    )
  end
end

