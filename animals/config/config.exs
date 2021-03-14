import Config

config :app, App.Repo,
  database: "tss_ecto_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn


config :app, ecto_repos: [App.Repo]
