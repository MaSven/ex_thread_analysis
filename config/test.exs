import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :threagile_visualizer, ThreagileVisualizerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "rf741pxUY75zdhIyM9VbG1Ef6INYYfIfvMKBYP8AX8U2h5zLEvoMqg9It474YhcY",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
