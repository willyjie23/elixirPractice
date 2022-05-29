defmodule ElixirPracticeWeb.PageController do
  use ElixirPracticeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
