defmodule ApiWeb.CustomerLive.FormComponent do
  use ApiWeb, :live_component

  alias Api.Swiftshop

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage customer records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="customer-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:customer_id]} type="number" label="Customer" />
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:password]} type="text" label="Password" />
        <.input field={@form[:billing_company]} type="text" label="Billing company" />
        <.input field={@form[:billing_first_name]} type="text" label="Billing first name" />
        <.input field={@form[:billing_last_name]} type="text" label="Billing last name" />
        <.input field={@form[:billing_address_1]} type="text" label="Billing address 1" />
        <.input field={@form[:billing_address_2]} type="text" label="Billing address 2" />
        <.input field={@form[:billing_city]} type="text" label="Billing city" />
        <.input field={@form[:billing_state]} type="text" label="Billing state" />
        <.input field={@form[:billing_zip_code]} type="text" label="Billing zip code" />
        <.input field={@form[:billing_country]} type="text" label="Billing country" />
        <.input field={@form[:billing_phone_number]} type="text" label="Billing phone number" />
        <.input field={@form[:billing_taxid]} type="text" label="Billing taxid" />
        <.input field={@form[:shipping_company]} type="text" label="Shipping company" />
        <.input field={@form[:shipping_first_name]} type="text" label="Shipping first name" />
        <.input field={@form[:shipping_last_name]} type="text" label="Shipping last name" />
        <.input field={@form[:shipping_address_1]} type="text" label="Shipping address 1" />
        <.input field={@form[:shipping_address_2]} type="text" label="Shipping address 2" />
        <.input field={@form[:shipping_city]} type="text" label="Shipping city" />
        <.input field={@form[:shipping_state]} type="text" label="Shipping state" />
        <.input field={@form[:shipping_zipcode]} type="text" label="Shipping zipcode" />
        <.input field={@form[:shipping_country]} type="text" label="Shipping country" />
        <.input field={@form[:shipping_phone_number]} type="text" label="Shipping phone number" />
        <.input field={@form[:shipping_address_type]} type="number" label="Shipping address type" />
        <.input field={@form[:customer_group_id]} type="number" label="Customer group" />
        <.input field={@form[:enabled]} type="checkbox" label="Enabled" />
        <.input field={@form[:mail_list]} type="checkbox" label="Mail list" />
        <.input field={@form[:non_taxable]} type="checkbox" label="Non taxable" />
        <.input
          field={@form[:disable_billing_same_as_shipping]}
          type="checkbox"
          label="Disable billing same as shipping"
        />
        <.input field={@form[:comments]} type="text" label="Comments" />
        <.input field={@form[:additional_field_1]} type="text" label="Additional field 1" />
        <.input field={@form[:additional_field_2]} type="text" label="Additional field 2" />
        <.input field={@form[:additional_field_3]} type="text" label="Additional field 3" />
        <.input
          field={@form[:total_store_credit]}
          type="number"
          label="Total store credit"
          step="any"
        />
        <.input field={@form[:reset_password]} type="checkbox" label="Reset password" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Customer</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{customer: customer} = assigns, socket) do
    changeset = Swiftshop.change_customer(customer)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"customer" => customer_params}, socket) do
    changeset =
      socket.assigns.customer
      |> Swiftshop.change_customer(customer_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"customer" => customer_params}, socket) do
    save_customer(socket, socket.assigns.action, customer_params)
  end

  defp save_customer(socket, :edit, customer_params) do
    case Swiftshop.update_customer(socket.assigns.customer, customer_params) do
      {:ok, customer} ->
        notify_parent({:saved, customer})

        {:noreply,
         socket
         |> put_flash(:info, "Customer updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_customer(socket, :new, customer_params) do
    case Swiftshop.create_customer(customer_params) do
      {:ok, customer} ->
        notify_parent({:saved, customer})

        {:noreply,
         socket
         |> put_flash(:info, "Customer created successfully")
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
