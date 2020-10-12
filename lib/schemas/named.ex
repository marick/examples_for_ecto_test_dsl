defmodule App.Schemas.Named do
  use Ecto.Schema
  import Ecto.Changeset

  schema "named" do
    field :name, :string
    field :date_string, :string, virtual: true
    field :date, :date
    field :lock_version, :integer
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :name, :date_string])
    |> validate_required([:name, :date_string])
    |> cast_date
    |> unique_constraint(:name)
    |> optimistic_lock(:lock_version)

  end


  defp cast_date(changeset) do
    case Date.from_iso8601(changeset.changes.date_string) do
      {:ok, date} ->
        put_change(changeset, :date, date)
      {:error, _} ->
        add_error(changeset, :date_string, "is not a valid date")
    end
  end
  
end
