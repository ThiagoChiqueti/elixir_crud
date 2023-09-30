defmodule DwvWeb.PageController do
  use DwvWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
