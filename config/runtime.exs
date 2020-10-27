import Config

config :ecozhop, EcozhopWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [host: System.get_env("HOST"), port: System.get_env("PORT")],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  root: "."

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :ecozhop, Ecozhop.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("DB_HOSTNAME"),
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_NAME"),
  pool_size: 20
# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :ecozhop, EcozhopWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#         transport_options: [socket_opts: [:inet6]]
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :ecozhop, EcozhopWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# Finally import the config/prod.secret.exs which loads secrets
# and configuration from environment variables.
