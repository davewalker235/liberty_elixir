defmodule Liberty.Repo.Migrations.CreateSeasons do
  use Ecto.Migration

  def change do
    create table(:seasons) do
      add :title, :string
      add :dates, {:array, :date}

      timestamps()
    end

  end
end
