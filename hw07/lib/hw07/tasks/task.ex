defmodule Hw07.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :time_spent, :integer
    field :title, :string
    belongs_to :user, Hw07.Users.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :completed, :time_spent, :user_id])
    |> validate_required([:title, :desc, :completed, :time_spent, :user_id])
    |> validate_time_spent
  end

  def validate_time_spent(changeset) do
    validate_change(changeset, :time_spent, fn _, time_spent ->
      cond do
        (time_spent < 0) -> [{:time_spent,"Can't use negative value"}]
        (rem(time_spent, 15) != 0) -> [{:time_spent, "Time spent must be multiple of 15"}]
        true -> []
      end
    end)
  end
end
