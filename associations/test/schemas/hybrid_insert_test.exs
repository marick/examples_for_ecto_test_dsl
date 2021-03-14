defmodule Example.HybridInsertTest do
  use ExUnit.Case, async: true
  use FlowAssertions
  use FlowAssertions.Ecto
  import FlowAssertions.AssertionA
  alias Examples.Insert.Animal.Tester
  alias App.Schemas
  

  test "fetching params" do
    params = Tester.params(:note_free) # |> IO.inspect
    # {"name" => "Bossie", "species_id" => "608"}
    
    assert params["name"] == "Bossie"
    assert {species_id, ""} = Integer.parse(params["species_id"])

    # Note that the Species value had to be created in order to
    # get the `:species_id`.
    species = App.Repo.get(Schemas.Species, species_id) # |> IO.inspect
    # %App.Schemas.Species{
    #   __meta__: #Ecto.Schema.Metadata<:loaded, "species">,
    #   animals: #Ecto.Association.NotLoaded<association :animals is not loaded>,
    #   id: 608,
    #   inserted_at: ~N[2021-02-27 22:58:43],
    #   name: "bovine",
    #   updated_at: ~N[2021-02-27 22:58:43]
    # }

    assert species.id == species_id
  end

  test "fetching a changeset from validation" do
    changeset = Tester.validation_changeset(:note_free) # |> IO.inspect
    # Ecto.Changeset<
    #   action: nil,
    #   changes: %{name: "Bossie", species_id: 646},
    #   errors: [],
    #   ...

    changeset
    |> assert_valid
    |> assert_changes(name: "Bossie")
  end

  test "fetching the return value from `insert`" do
    animal = Tester.inserted(:note_free) # |> IO.inspect
    # %App.Schemas.Animal{    
    #   __meta__: #Ecto.Schema.Metadata<:loaded, "animals">,
    #   id: 389,
    #   lock_uuid: "5e5ecfbf-4e5a-42c2-9b9e-33b9c54ab4a1",
    #   name: "Bossie",
    #   species: #Ecto.Association.NotLoaded<association :species is not loaded>,
    #   species_id: 652,
    #   ...

    animal
    |> refute_assoc_loaded(:species)
    |> assert_field(name: "Bossie")
  end

  test "insertion failure throws an assertion" do
    # Tester.inserted(:duplicate_name)
    # Insertion failed
    # code: Tester.inserted(:duplicate_name)
    # left: {:error, #Ecto.Changeset<...>}

    # This makes sense because this has to be a test-writing failure.
    
    assertion_fails(~r/the actual insertion attempt failed/,
      [left: &(match?({:error, %Ecto.Changeset{}}, &1))],
      fn ->
        Tester.inserted(:duplicate_name)
      end)
  end

  test "every workflow returns the result of each of its steps" do
    result = Tester.check_workflow(:note_free) # |> IO.inspect
    
    #   field_checks: :uninteresting_result,
    #   ok_content: %App.Schemas.Animal{...}
    #   try_changeset_insertion: {:ok, %App.Schemas.Animal{...}}
    #   field_calculation_checks: :uninteresting_result,
    #   as_cast_checks: :uninteresting_result,
    #   example_specific_changeset_checks: :uninteresting_result,
    #   assert_valid_changeset: :uninteresting_result,
    #   changeset_from_params: #Ecto.Changeset<...>
    #   params: %{...},
    #   repo_setup: %{...}
    #   example: %{...}

    assert Keyword.has_key?(result, :params)
    assert Keyword.has_key?(result, :changeset_from_params)
    assert Keyword.has_key?(result, :try_changeset_insertion)
  end
end
