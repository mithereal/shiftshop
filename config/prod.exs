import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.

# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :api, ApiWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"


# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: Api.Finch

# Do not print debug messages in production
config :logger, level: :all

port = String.to_integer(System.get_env("PORT") || "4000")

hostname = System.get_env("PHX_HOST") || "localhost"

config :api, ApiWeb.Endpoint,
  url: [host: hostname, port: port],
  check_origin: false,
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  socket_options: [:inet6],
  force_ssl: [
    host: nil,
    rewrite_on: [:x_forwarded_port, :x_forwarded_proto],
    # maybe true when we use this for real
    hsts: false
  ],
server: true

config :oauth2_shift4shop,
       json_library: Jason

config :oauth2_shift4shop, :credentials,
       client_id: System.get_env("SHIFT4SHOP_CLIENT_ID"),
       client_secret: System.get_env("SHIFT4SHOP_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
       client_id: System.get_env("GITHUB_CLIENT_ID"),
       client_secret:  System.get_env("GITHUB_CLIENT_SECRET")

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
