defmodule GuadianTestsWeb.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :guadian_tests,
    module: GuadianTestsWeb.Guardian,
    error_handler: GuadianTestsWeb.AuthErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end

defmodule GuadianTestsWeb.AuthErrorHandler do
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, reason}, _opts) do
    IO.inspect(reason)
    body = Jason.encode!(%{message: to_string(type) <> " " <> to_string(reason)})
    send_resp(conn, 401, body)
  end
end
