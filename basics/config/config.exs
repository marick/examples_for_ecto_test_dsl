import Config

config :app, App.Repo,
  database: "etd_examples_basic",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn


config :app, ecto_repos: [App.Repo]
