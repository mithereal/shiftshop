defmodule ApiWeb.CustomerLive.Index do
  use ApiWeb, :live_view

  alias Api.Swiftshop
  alias Api.Swiftshop.Customer

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :customer_collection, Swiftshop.list_customer())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Customer")
    |> assign(:customer, Swiftshop.get_customer!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Customer")
    |> assign(:customer, %Customer{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Customer")
    |> assign(:customer, nil)
  end

  @impl true
  def handle_info({ApiWeb.CustomerLive.FormComponent, {:saved, customer}}, socket) do
    {:noreply, stream_insert(socket, :customer_collection, customer)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    customer = Swiftshop.get_customer!(id)
    {:ok, _} = Swiftshop.delete_customer(customer)

    {:noreply, stream_delete(socket, :customer_collection, customer)}
  end
end
