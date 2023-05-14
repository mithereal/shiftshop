defmodule ApiWeb.AuthController do
  @moduledoc """
  Auth controller responsible for handling Ueberauth responses
  """

  use ApiWeb, :controller

  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Api.Users.User
  alias ApiWeb.UserAuth

  require Logger

  def request(conn, params \\ nil) do
    case params do
      nil ->
        render(conn, :request, callback_url: Helpers.callback_url(conn), layout: false)

      params ->
        render(conn, :request,
          callback_url: Helpers.callback_url(conn),
          layout: false,
          form: params
        )
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> UserAuth.log_out_user()
  end

  def token(conn, params) do
    json(conn, params)
  end

  def callback(%{assigns: %{ueberauth_failure: error}} = conn, _params) do
    error = List.first(error.errors)

    conn
    |> put_flash(:error, "Failed to authenticate. #{error.message}")
    |> redirect(to: "/users/log_in")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    ## add user email etc end
    case Api.Users.find_or_create(auth) do
      {:ok, user} ->
        conn =
          conn
          |> put_flash(:info, "Successfully authenticated.")
          |> UserAuth.log_in_user(user, %{swift4shop_token: auth.credentials.token})

      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/users/log_in")
    end
  end
end
