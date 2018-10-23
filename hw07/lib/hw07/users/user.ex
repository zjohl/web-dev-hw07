defmodule Hw07.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    has_many :tasks, Hw07.Tasks.Task
    belongs_to :manager, Hw07.Users.User
    has_many :underlings, Hw07.Users.User, foreign_key: :manager_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin, :manager_id])
    |> validate_required([:email, :admin, :manager_id])
  end
end
