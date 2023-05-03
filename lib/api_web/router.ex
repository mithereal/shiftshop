defmodule ApiWeb.Router do
  use ApiWeb, :router
  use ApiWeb, :user_auth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ApiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Ueberauth
  end

  pipeline :browser_with_no_csrf do
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {ApiWeb.LayoutView, :root})
    plug(:fetch_current_user)
  end

  scope "/", ApiWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/auth", ApiWeb do
    pipe_through [:browser_with_no_csrf, :redirect_if_user_is_authenticated]

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApiWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
