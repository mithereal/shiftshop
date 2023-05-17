defmodule ApiWeb.UserRegistrationController do
  use ApiWeb, :controller

  alias Api.Users
  alias Api.Users.User
  alias ApiWeb.UserAuth

  def new(conn, _params) do
    changeset = Users.change_user_registration(%User{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params, label: "user_params")
    user = Users.get_user_by_shift4shop_uid(user_params)

    case Users.register_user(user, user_params) do
      {:ok, user} ->
        IO.inspect(user, label: "user")
        {:ok, _} =
          Users.deliver_user_confirmation_instructions(
            user,
            &url(~p"/users/confirm/#{&1}")
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
