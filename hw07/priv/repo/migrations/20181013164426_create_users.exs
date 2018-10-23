defmodule Hw07.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
