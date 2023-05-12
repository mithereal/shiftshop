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
    plug(:fetch_current_user)
  end

  pipeline :user do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ApiWeb.Layouts, :user}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(:fetch_current_user)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Ueberauth
  end

  pipeline :browser_with_no_csrf do
    plug :accepts, ["html"]
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {ApiWeb.Layouts, :root})
    plug(:fetch_current_user)
    plug(ApiWeb.AllowCrossOriginIframe)
  end

  scope "/", ApiWeb do
    pipe_through :browser

    get "/", PageController, :landing
  end

  scope "/", ApiWeb do
    pipe_through :user

    live_session :require_authenticated_user,
    layout: {ApiWeb.Layouts, :user},
      on_mount: [
        {ApiWeb.UserAuth, :ensure_authenticated},
        {ApiWeb.Path, :put_path_in_socket}
      ] do
      live "/home", CustomerLive.Index, :index
      live "/customers", CustomerLive.Index, :index
      live "/customers/new", CustomerLive.Index, :new
      live "/customers/:id/edit", CustomerLive.Index, :edit

      live "/customers/:id", CustomerLive.Show, :show
      live "/customers/:id/show/edit", CustomerLive.Show, :edit

      live "/products", ProductLive.Index, :index
      live "/products/new", ProductLive.Index, :new
      live "/products/:id/edit", ProductLive.Index, :edit

      live "/products/:id", ProductLive.Show, :show
      live "/products/:id/show/edit", ProductLive.Show, :edit

      live "/orders", OrderLive.Index, :index
      live "/orders/new", OrderLive.Index, :new
      live "/orders/:id/edit", OrderLive.Index, :edit

      live "/orders/:id", OrderLive.Show, :show
      live "/orders/:id/show/edit", OrderLive.Show, :edit
    end
  end

  scope "/auth", ApiWeb do
    pipe_through [:browser_with_no_csrf, :redirect_if_user_is_authenticated]

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  scope "/settings", ApiWeb do
    pipe_through [:browser, :browser_with_no_csrf]

    get "/:provider", ProviderSettingsController, :edit
  end


  scope "/users", ApiWeb do
    pipe_through([:browser, :redirect_if_user_is_authenticated])

    get("/register", UserRegistrationController, :new)
    post("/register", UserRegistrationController, :create)
    get("/log_in", UserSessionController, :new)
    post("/log_in", UserSessionController, :create)
    get("/reset_password", UserResetPasswordController, :new)
    post("/reset_password", UserResetPasswordController, :create)
    get("/reset_password/:token", UserResetPasswordController, :edit)
    put("/reset_password/:token", UserResetPasswordController, :update)
  end

  scope "/users", ApiWeb do
    pipe_through([:browser, :require_authenticated_user])

    get("/force_logout", UserSessionController, :force_logout)
    get("/log_out", UserSessionController, :delete)
    delete("/log_out", UserSessionController, :delete)
    get("/confirm", UserConfirmationController, :new)
    post("/confirm", UserConfirmationController, :create)
    get("/confirm/:token", UserConfirmationController, :confirm)
  end

  scope "/users/settings", ApiWeb do
    pipe_through([:browser, :require_authenticated_user])

    get("/", UserSettingsController, :edit)
    get("/confirm_email/:token", UserConfirmationController, :confirm)
  end

  scope "/session", ApiWeb do
    pipe_through([:browser])

    get("/force_logout", UserSessionController, :force_logout)
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
