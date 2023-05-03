defmodule ApiWeb.CORS do
  endpoint = Application.compile_env(:api, ApiWeb.Endpoint)
  origins = Keyword.get(endpoint, :origins) || "*"

  use Corsica.Router,
    origins: origins,
    allow_credentials: Application.compile_env(:api, :allow_credentials, true),
    max_age: Application.compile_env(:api, :max_age, 600)

  resource("/*")

  # We can override single settings as well.
  resource("/public/*", allow_credentials: false)
end
