defmodule Hw07Web.SessionController do
  use Hw07Web, :controller
  # Module copied from Nat's Lecture notes

  def create(conn, %{"email" => email}) do
    user = Hw07.Users.get_user_by_email(email)
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back #{user.email}")
      |> redirect(to: Routes.task_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Login failed.")
      |> redirect(to: Routes.task_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
