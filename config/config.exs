# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :guadian_tests,
  ecto_repos: [GuadianTests.Repo]

# Configures the endpoint
config :guadian_tests, GuadianTestsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0BNd0qQ1IX+t9CtbWcL0n3WBkt/sc+KM6eMBFelghAadA9YILBwduXfbLo4UW7dX",
  render_errors: [view: GuadianTestsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GuadianTests.PubSub,
  live_view: [signing_salt: "97poSFXm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"


config :guadian_tests, GuadianTestsWeb.Guardian,
       issuer: "my_app",
       secret_key: "oinVB746Ae+ndZIKHZaxUjvPFTZ0i+4yKOEFlYGZPXzXYb+vHRmhCG+mJABbWXlI"
