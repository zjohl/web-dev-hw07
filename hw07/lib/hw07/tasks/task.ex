defmodule Hw07.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :time_spent, :integer
    field :title, :string
    belongs_to :user, Hw07.Users.User
    has_many :time_blocks, Hw07.TimeBlocks.TimeBlock

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :completed, :time_spent, :user_id])
    |> validate_required([:title, :desc, :completed, :time_spent, :user_id])
  end
end
