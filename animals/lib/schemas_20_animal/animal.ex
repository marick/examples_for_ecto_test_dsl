defmodule App.Schemas20.Animal do
  alias App.Schemas20, as: Schemas
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field :name, :string
    belongs_to :species, Schemas.Species
    has_many :notes, Schemas.Note

    # calculated
    field :lock_uuid, Ecto.UUID
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :name, :species_id])
    |> cast_assoc(:notes)
    |> validate_required([:name])
    |> unique_constraint(:name)
    |> foreign_key_constraint(:species_id)
    |> optimistic_lock(:lock_uuid, fn _ -> Ecto.UUID.generate end)
  end
end
