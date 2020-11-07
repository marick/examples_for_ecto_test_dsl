defmodule App.Repo.Migrations.CreateNamed do
  use Ecto.Migration

  def change do
    create table(:named) do
      add :name,            :string,  null: false
      add :date,            :date,    null: false
      add :days_since_2000, :integer, null: false

      timestamps()
    end

    create unique_index(:named, [:name])
  end
end
