defmodule App.Repo.Migrations.CreateNamed do
  use Ecto.Migration

  def change do
    create table(:named) do
      add :name, :string
      add :date, :date
      add :lock_version, :integer, default: 1

      timestamps()
    end

    create unique_index(:named, [:name])
  end
end
