defmodule App.Repo.Migrations.AddAnimalsTable do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name,            :string,  null: false
      add :notes,           :string
      
      add :lock_uuid,       :uuid,    null: false

      add :species_id, references(:species), on_delete: :restrict, null: false
      
      timestamps()
    end

    create unique_index(:animals, [:name])
  end
end
