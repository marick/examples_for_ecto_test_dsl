defmodule App.Schemas20.Note do
  alias App.Schemas20, as: Schemas
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :text, :string
    field :date, :date
    belongs_to :animal, Schemas.Animal
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:text, :id, :animal_id])
    |> validate_required([:text])
    |> put_change(:date, Date.utc_today)
  end
end
