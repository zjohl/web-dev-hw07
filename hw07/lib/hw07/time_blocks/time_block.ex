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

  def convert_dates(attrs) do
    init_start_time = attrs["start_time"]
    init_end_time = attrs["end_time"]

    start_time = if is_integer(init_start_time), do: init_start_time, else: 1212423234
    end_time = if is_integer(init_end_time), do: init_end_time, else: 1512423234
    %{
      task_id: attrs["task_id"],
      start_time: start_time,
      end_time: end_time,
    }
  end
end
