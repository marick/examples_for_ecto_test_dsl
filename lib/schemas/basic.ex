defmodule App.Schemas.Basic do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :age, :integer
    field :date, :date
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:age, :date])
    |> validate_required([:age, :date])
  end
end
