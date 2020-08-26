defmodule GuadianTests.Repo do
  use Ecto.Repo,
    otp_app: :guadian_tests,
    adapter: Ecto.Adapters.Postgres
end
