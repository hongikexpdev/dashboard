# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :public_html,
  ecto_repos: [PublicHtml.Repo]

# Configures the endpoint
config :public_html, PublicHtml.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tSRhPjRTBiPmpFnl3WkOzpsgE10zaHwQgJIWOcMBfYVRbvs+GrguCYPKjPf0oh4m",
  render_errors: [view: PublicHtml.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PublicHtml.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
