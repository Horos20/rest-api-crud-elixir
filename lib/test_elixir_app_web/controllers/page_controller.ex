defmodule TestElixirAppWeb.PageController do
  use TestElixirAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
