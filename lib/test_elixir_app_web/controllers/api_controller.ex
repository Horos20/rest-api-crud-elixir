defmodule TestElixirAppWeb.ApiController do
  use TestElixirAppWeb, :controller
  alias Schemas.Workers
  alias TestElixirApp.Repo
  import Ecto.Query

  def index(conn, _params) do
    query = from w in Workers
    result = Repo.all(query)

    conn
    |> put_status(200)
    |> json(%{data: result, status: "success", message: "Successfully! All records has been fetched."})
  end

  def create(conn, _params) do
    body_params = conn.body_params
    case Workers.create_worker(body_params) do
      {:ok, worker} ->
        conn
        |> put_status(200)
        |> json(%{data: [worker], message: "Successfully! Record has been added.", status: "success"})
      {:error, changeset} ->
        conn
        |> put_status(400)
        |> json(%{data: changeset, message: "Error! Record has not been added.", status: "error"})
    end
  end

  def update(conn, %{"id" => id}) do
    body_params = conn.body_params
    case Workers.update_worker(id, body_params) do
      {:ok, worker} ->
        conn
        |> put_status(200)
        |> json(%{data: [worker], message: "Successfully! Record has been updated.", status: "success"})
      {:error, changeset} ->
        conn
        |> put_status(400)
        |> json(%{data: changeset, message: "Error! Record has not been updated.", status: "error"})
      end
  end

  def delete(conn, %{"id" => id}) do
    case Workers.delete_worker(id) do
      {:ok, _worker} ->
        conn
        |> put_status(200)
        |> json(%{message: "Successfully! Record has been deleted.", status: "success"})
      {:error, _changeset} ->
        conn
        |> put_status(400)
        |> json(%{message: "Error! Record has not been deleted.", status: "error"})
    end
  end
end
