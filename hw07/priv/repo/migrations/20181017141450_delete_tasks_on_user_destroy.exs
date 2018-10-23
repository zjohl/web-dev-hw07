defmodule Hw07.Repo.Migrations.DeleteTasksOnUserDestroy do
  use Ecto.Migration

  def up do
    drop constraint(:tasks, "tasks_user_id_fkey")
    alter table(:tasks) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end

  def down do
    drop constraint(:tasks, "tasks_user_id_fkey")
    alter table(:tasks) do
      modify :user_id, references(:users, on_delete: :nothing)
    end
  end
end
