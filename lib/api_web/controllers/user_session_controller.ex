defmodule ApiWeb.UserSessionController do
  use ApiWeb, :controller

  use Phoenix.Component

  alias Api.Users
  alias Api.Users.User
  alias ApiWeb.UserAuth

  def new(conn, _params) do
    render(conn, :new, error_message: nil)
  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Users.get_user_by_email_and_password(email, password) do
      conn
      |> put_flash(:info, "Welcome back!")
      |> UserAuth.log_in_user(user, user_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      render(conn, :new, error_message: "Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end

  def find_current_user(session) do
    with user_token when not is_nil(user_token) <- session["user_token"],
         %User{} = user <- Users.get_user_by_session_token(user_token),
         do: user
  end

  def assign_defaults(session, socket) do
    ApiWeb.Endpoint.subscribe(UserAuth.pubsub_topic())

    socket =
      assign_new(socket, :current_user, fn ->
        find_current_user(session)
      end)

    case socket.assigns.current_user do
      %User{} ->
        socket

      _other ->
        socket
        |> put_flash(:error, "You must log in to access this page.")
        |> redirect(to: Routes.user_session_path(socket, :new))
    end
  end
end
