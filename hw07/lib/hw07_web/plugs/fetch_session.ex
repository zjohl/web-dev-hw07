defmodule Hw07Web.Plugs.FetchSession do
  import Plug.Conn

  # Module copied from Nat's Lecture notes
  def init(args), do: args

  def call(conn, _args) do
    user = Hw07.Users.get_user(get_session(conn, :user_id) || -1)
    if user do
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end
end
