defmodule NetworkApi.Repo.Migrations.CreateNodes do
  use Ecto.Migration

  def change do
    create table(:nodes) do
      add :name, :string
      add :description, :text
      add :tag, :string

      timestamps()
    end

  end
end
