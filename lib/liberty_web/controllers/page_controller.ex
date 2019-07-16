defmodule LibertyWeb.PageController do
  use LibertyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
