defmodule ApiWeb.ProviderSettingsController do
  use ApiWeb, :controller

  def edit(conn, _params) do
    render(conn, :edit, layout: false)
  end
end
