defmodule Hw07.Repo.Migrations.CreateTimeBlocks do
  use Ecto.Migration

  def change do
    create table(:time_blocks) do
      add :start_time, :bigint, null: false
      add :end_time, :bigint, null: false
      add :task_id, references(:tasks, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:time_blocks, [:task_id])
  end
end
