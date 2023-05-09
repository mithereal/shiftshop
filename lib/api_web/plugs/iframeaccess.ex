defmodule ApiWeb.AllowCrossOriginIframe do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _options) do
    conn
    |> authenticate_source()
    |> delete_resp_header("x-frame-options")
  end

  defp authenticate_source(conn) do
    # check that source is allowed to delete header
  end
end