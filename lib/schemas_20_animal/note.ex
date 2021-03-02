defmodule App.Schemas20.Note do
  alias App.Schemas20, as: Schemas
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :text, :string
    field :date, :date

    # calculated
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:string, :id])
  end
end
