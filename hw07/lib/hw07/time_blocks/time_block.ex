defmodule Hw07.TimeBlocks.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset


  schema "time_blocks" do
    field :end_time, :integer
    field :start_time, :integer
    belongs_to :task, Hw07.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(time_block, attrs) do
    time_block
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :end_time, :task_id])
  end
end
