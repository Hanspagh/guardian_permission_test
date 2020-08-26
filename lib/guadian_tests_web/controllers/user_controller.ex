defmodule GuadianTestsWeb.UserController do
  use GuadianTestsWeb, :controller




  plug Guardian.Permissions, [ensure: %{admin: [:read]}] when action in [:admin]
  @doc """
  List users
  """
  @spec admin(map, map):: map
  def admin(conn, _) do
    token = Guardian.Plug.current_token(conn)
    send_resp(conn, 200, token)
  end

  @spec index(map, map):: map
  def index(conn, _) do
    token = Guardian.Plug.current_token(conn)
    send_resp(conn, 200, token)
  end

  @doc """
  sign in user
  """
  @spec sign_in(map, map):: map
  def sign_in(conn, _) do
    conn = GuadianTestsWeb.Guardian.Plug.sign_in(conn, %{id: 1})
    body = Jason.encode!(%{message: "ok"})
    send_resp(conn, 200, body)
  end

  @spec sign_in(map, map):: map
  def sign_in_admin(conn, _) do
    conn = GuadianTestsWeb.Guardian.Plug.sign_in(conn, %{id: 1}, %{}, permissions: %{admin: [:read]})
    body = Jason.encode!(%{message: "ok"})
    send_resp(conn, 200, body)
  end

end
