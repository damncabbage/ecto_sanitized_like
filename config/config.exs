# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

if Mix.env() == :test do
  config :ecto_sanitized_like, EctoSanitizedLike.Test.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: (
      System.get_env("TEST_DB_USER")
      || System.get_env("USER")
      || "postgres"
    ),
    database: "ecto_sanitized_like_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox,
    priv: "test/support/"

  config :ecto_sanitized_like, ecto_repos: [EctoSanitizedLike.Test.Repo]
  config :logger, level: :warn
end
