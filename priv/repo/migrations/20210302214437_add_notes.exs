defmodule App.Repo.Migrations.AddNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :date, :date, null: false
      add :text, :string, null: false
      add :animal_id, references(:species), null: false
    end
  end
end
