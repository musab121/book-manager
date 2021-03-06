# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :booker,
  ecto_repos: [Booker.Repo]

# Configures the endpoint
config :booker, BookerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W4tmyxL8jJ/usL47H3WkoDPSgGYA2Ttmg6AAkKDi3F1t5fCcMeMMpRX2NHAikcrS",
  render_errors: [view: BookerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Booker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :booker, Booker.Auth.Guardian,
  issuer: "booker", # Name of your app/company/product
  secret_key: "79lq7O91uxEXsm8tMnhiwTBz0M1PA3VNTZ8zFJXE5dT72F8N/UqXFjk5lGgRno6m" # Replace this with the output of the mix command

config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}
config :ja_serializer,
  key_format: :underscored

# config :cors_plug,
#   origin: ["http:/localhost:8080"],
#   max_age: 86400,
#   methods: ["GET", "POST"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
