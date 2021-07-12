defmodule Projeto.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :name, :string
      add :message, :text

      timestamps()
    end

  end
end
