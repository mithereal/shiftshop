defmodule Api.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ApiWeb.Telemetry,
      # Start the Ecto repository
      Api.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Api.PubSub},
      # Start Finch
      {Finch, name: Api.Finch},
      # Start the Endpoint (http/https)
      ApiWeb.Endpoint,
      {DynamicSupervisor, strategy: :one_for_one, name: :shift4shop_token_supervisor},
      {Registry, keys: :unique, name: :shift4shop_tokens}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Api.Supervisor]

    Supervisor.start_link(children, opts)
    |> create_default_users()
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  def create_default_users(response) do
    host =
      Application.get_env(:api, ApiWeb.Endpoint)
      |> hostname()

    Api.Users.register_user(%{
      email: "admin@" <> host,
      password: "mohap",
      password_confirmation: "mohap"
    })

    response
  end

  def hostname(url) do
    case Keyword.get(url, :url) do
      [{_, hostname}, {_, _port}, _] -> hostname
      [host: hostname] -> hostname
    end
  end
end
