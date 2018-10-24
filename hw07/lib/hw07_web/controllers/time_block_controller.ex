defmodule Hw07Web.TimeBlockController do
  use Hw07Web, :controller

  alias Hw07.TimeBlocks
  alias Hw07.TimeBlocks.TimeBlock

  def index(conn, _params) do
    time_blocks = TimeBlocks.list_time_blocks()
    render(conn, "index.json",  time_blocks: time_blocks)
  end

  def create(conn, %{"time_block" => time_block_params}) do
    with {:ok, %TimeBlock{} = time_block} <- TimeBlocks.create_time_block(time_block_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.time_block_path(conn, :show, time_block))
      |> render("show.json", time_block: time_block)
    else err ->
      conn
      |> put_status(500)
      |> json(%{error_code: "500", reason_given: err})
    end
  end

  def show(conn, %{"id" => task_id}) do
    time_blocks = TimeBlocks.get_time_blocks(task_id)
    render(conn, "index.json",  time_blocks: time_blocks)
  end

  def update(conn, %{"id" => id, "time_block" => time_block_params}) do
    time_block = TimeBlocks.get_time_block!(id)

    with {:ok, %TimeBlock{} = time_block} <- TimeBlocks.update_time_block(time_block, time_block_params) do
      render(conn, "show.json", time_block: time_block)
    else err ->
      conn
      |> put_status(500)
      |> json(%{error_code: "500", reason_given: err})
    end
  end

  def delete(conn, %{"id" => id}) do
    time_block = TimeBlocks.get_time_block!(id)

    with {:ok, %TimeBlock{}} <- TimeBlocks.delete_time_block(time_block) do
      send_resp(conn, :no_content, "")
    else err ->
      conn
      |> put_status(500)
      |> json(%{error_code: "500", reason_given: err})
    end
  end
end
