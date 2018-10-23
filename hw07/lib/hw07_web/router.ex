defmodule Hw07Web.Router do
  use Hw07Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Hw07Web.Plugs.FetchSession
  end

  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug Hw07Web.Plugs.FetchSession # FIXME: "FetchUser"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hw07Web do
    pipe_through :browser

    get "/", TaskController, :index
    get "/task_report", TaskController, :task_report
    resources "/tasks", TaskController
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  scope "/ajax", Hw07Web do
    pipe_through :ajax
    resources "/time_blocks", TimeBlockController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hw07Web do
  #   pipe_through :api
  # end
end
