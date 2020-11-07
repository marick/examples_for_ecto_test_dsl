defmodule App.Schemas.Named do
  use Ecto.Schema
  import Ecto.Changeset

  schema "named" do
    field :name, :string
    field :date_string, :string, virtual: true

    # calculated
    field :date, :date
    field :days_since_2000, :integer
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :name, :date_string])
    |> validate_required([:name, :date_string])
    |> cast_date
    |> count_the_days
    |> unique_constraint(:name)
  end


  defp cast_date(changeset) do
    case Date.from_iso8601(changeset.changes.date_string) do
      {:ok, date} ->
        put_change(changeset, :date, date)
      {:error, _} ->
        add_error(changeset, :date_string, "is not a valid date")
    end
  end

  @start_date ~D[2000-01-01]

  defp count_the_days(changeset) do
    cond do
      Keyword.has_key?(changeset.errors, :date_string) ->
        changeset
      Date.compare(changeset.changes.date, @start_date) == :lt ->
        add_error(changeset, :date_string, "must be this century")
      true -> 
        days = Date.diff(changeset.changes.date, @start_date)
        put_change(changeset, :days_since_2000, days)
    end
  end
  
end
