defmodule App.Schemas20.Species do
  alias App.Schemas20, as: Schemas
  use Ecto.Schema
  import Ecto.Changeset

  schema "species" do
    field :name, :string
    has_many :animals, Schemas.Animal
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
