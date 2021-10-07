defmodule ThreagileVisualizer.Repo.Migrations.CreateArchitectures do
  use Ecto.Migration

  def change do
    create table(:architectures) do
      add :name, :string

      timestamps()
    end
  end
end
