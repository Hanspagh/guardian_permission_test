defmodule GuadianTestsWeb.PageController do
  use GuadianTestsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
