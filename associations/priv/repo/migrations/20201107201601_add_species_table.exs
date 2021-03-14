defmodule App.Repo.Migrations.AddSpeciesTable do
  use Ecto.Migration

  def change do
    create table(:species) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:species, [:name])
  end
end
