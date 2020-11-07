defmodule App.Schemas.Animal do
  alias App.Schemas
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field :name, :string
    field :notes, :string, default: "<no notes>"
    belongs_to :species, Schemas.Species

    # calculated
    field :lock_uuid, Ecto.UUID
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :name, :notes])
    |> validate_required([:name])
    |> unique_constraint(:name)
    |> optimistic_lock(:lock_uuid, fn _ -> Ecto.UUID.generate end)
  end
end
