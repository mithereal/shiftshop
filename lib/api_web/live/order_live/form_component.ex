defmodule ApiWeb.OrderLive.FormComponent do
  use ApiWeb, :live_component

  alias Api.Orders

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage order records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="order-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:invoice_number_prefix]} type="text" label="Invoice number prefix" />
        <.input field={@form[:invoice_number]} type="number" label="Invoice number" />
        <.input field={@form[:order_id]} type="number" label="Order" />
        <.input field={@form[:customer_id]} type="number" label="Customer" />
        <.input field={@form[:order_date]} type="text" label="Order date" />
        <.input field={@form[:order_status_id]} type="text" label="Order status" />
        <.input field={@form[:last_update]} type="text" label="Last update" />
        <.input field={@form[:user_id]} type="text" label="User" />
        <.input field={@form[:sales_person]} type="text" label="Sales person" />
        <.input field={@form[:continue_url]} type="text" label="Continue url" />
        <.input field={@form[:alternate_order_id]} type="text" label="Alternate order" />
        <.input field={@form[:order_type]} type="text" label="Order type" />
        <.input field={@form[:payment_token_id]} type="text" label="Payment token" />
        <.input field={@form[:billing_first_name]} type="text" label="Billing first name" />
        <.input field={@form[:billing_last_name]} type="text" label="Billing last name" />
        <.input field={@form[:billing_company]} type="text" label="Billing company" />
        <.input field={@form[:billing_address]} type="text" label="Billing address" />
        <.input field={@form[:billing_address_2]} type="text" label="Billing address 2" />
        <.input field={@form[:billing_city]} type="text" label="Billing city" />
        <.input field={@form[:billing_state]} type="text" label="Billing state" />
        <.input field={@form[:billing_zip_code]} type="text" label="Billing zip code" />
        <.input field={@form[:billing_country]} type="text" label="Billing country" />
        <.input field={@form[:billing_phone_number]} type="text" label="Billing phone number" />
        <.input field={@form[:billing_email]} type="text" label="Billing email" />
        <.input field={@form[:billing_payment_method]} type="text" label="Billing payment method" />
        <.input field={@form[:billing_on_line_payment]} type="text" label="Billing on line payment" />
        <.input field={@form[:billing_payment_method_id]} type="text" label="Billing payment method" />
        <.input field={@form[:shipment_list]} type="text" label="Shipment list" />
        <.input field={@form[:order_item_list]} type="text" label="Order item list" />
        <.input field={@form[:promotion_list]} type="text" label="Promotion list" />
        <.input field={@form[:order_discount]} type="number" label="Order discount" step="any" />
        <.input field={@form[:order_discount_coupon]} type="number" label="Order discount coupon" step="any" />
        <.input field={@form[:order_discount_promotion]} type="number" label="Order discount promotion" step="any" />
        <.input field={@form[:sales_tax]} type="number" label="Sales tax" step="any" />
        <.input field={@form[:sales_tax_2]} type="number" label="Sales tax 2" step="any" />
        <.input field={@form[:sales_tax_3]} type="number" label="Sales tax 3" step="any" />
        <.input field={@form[:order_amount]} type="number" label="Order amount" step="any" />
        <.input field={@form[:affiliate_commission]} type="number" label="Affiliate commission" step="any" />
        <.input field={@form[:transaction_list]} type="number" label="Transaction list" step="any" />
        <.input field={@form[:card_type]} type="text" label="Card type" />
        <.input field={@form[:card_number]} type="text" label="Card number" />
        <.input field={@form[:card_name]} type="text" label="Card name" />
        <.input field={@form[:card_expiration_month]} type="text" label="Card expiration month" />
        <.input field={@form[:card_expiration_year]} type="text" label="Card expiration year" />
        <.input field={@form[:card_issue_number]} type="text" label="Card issue number" />
        <.input field={@form[:card_start_month]} type="text" label="Card start month" />
        <.input field={@form[:card_start_year]} type="text" label="Card start year" />
        <.input field={@form[:card_address]} type="text" label="Card address" />
        <.input field={@form[:card_verification]} type="text" label="Card verification" />
        <.input field={@form[:reward_points]} type="text" label="Reward points" />
        <.input field={@form[:question_list]} type="text" label="Question list" />
        <.input field={@form[:referer]} type="text" label="Referer" />
        <.input field={@form[:ip]} type="text" label="Ip" />
        <.input field={@form[:customer_comments]} type="text" label="Customer comments" />
        <.input field={@form[:internal_comments]} type="text" label="Internal comments" />
        <.input field={@form[:external_comments]} type="text" label="External comments" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Order</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{order: order} = assigns, socket) do
    changeset = Orders.change_order(order)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"order" => order_params}, socket) do
    changeset =
      socket.assigns.order
      |> Orders.change_order(order_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"order" => order_params}, socket) do
    save_order(socket, socket.assigns.action, order_params)
  end

  defp save_order(socket, :edit, order_params) do
    case Orders.update_order(socket.assigns.order, order_params) do
      {:ok, order} ->
        notify_parent({:saved, order})

        {:noreply,
         socket
         |> put_flash(:info, "Order updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_order(socket, :new, order_params) do
    case Orders.create_order(order_params) do
      {:ok, order} ->
        notify_parent({:saved, order})

        {:noreply,
         socket
         |> put_flash(:info, "Order created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
