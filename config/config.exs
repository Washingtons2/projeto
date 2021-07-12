# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :projeto,
  ecto_repos: [Projeto.Repo]

# Configures the endpoint
config :projeto, ProjetoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lnz5TumrVm1jw/DqMqIO8sFiN82H/dljMXhEX3jVLTGormxsRKTSnq2SsqxuAea9",
  render_errors: [view: ProjetoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Projeto.PubSub,
  live_view: [signing_salt: "6zr1JaSs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
