# From Nat's lecture notes
defmodule Hw07Web.Plugs.RequireAdmin do
  use Hw07Web, :controller

  def init(args), do: args

  def call(conn, _params) do
    user = conn.assigns[:current_user]
    if user.admin do
      conn
    else
      conn
      |> put_flash(:error, "You don't have permissions to take that action")
      |> redirect(to: Routes.task_path(conn, :index))
      |> halt
    end
  end
end