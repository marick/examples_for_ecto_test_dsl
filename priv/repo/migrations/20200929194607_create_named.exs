defmodule App.Repo.Migrations.CreateNamed do
  use Ecto.Migration

  def change do
    create table(:named) do
      add :name, :string
      add :date, :date
      add :days_since_2000, :integer
      add :lock_uuid, :uuid

      timestamps()
    end

    create unique_index(:named, [:name])
  end
end
