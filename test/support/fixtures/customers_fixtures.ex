defmodule Api.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        mail_list: true,
        billing_country: "some billing_country",
        comments: "some comments",
        customer_group_id: 42,
        billing_state: "some billing_state",
        billing_taxid: "some billing_taxid",
        password: "some password",
        billing_phone_number: "some billing_phone_number",
        additional_field_1: "some additional_field_1",
        shipping_address_type: 42,
        billing_last_name: "some billing_last_name",
        email: "some email",
        shipping_state: "some shipping_state",
        disable_billing_same_as_shipping: true,
        shipping_first_name: "some shipping_first_name",
        billing_company: "some billing_company",
        billing_first_name: "some billing_first_name",
        non_taxable: true,
        additional_field_3: "some additional_field_3",
        total_store_credit: 120.5,
        additional_field_2: "some additional_field_2",
        billing_address_1: "some billing_address_1",
        shipping_company: "some shipping_company",
        shipping_city: "some shipping_city",
        shipping_address_2: "some shipping_address_2",
        billing_address_2: "some billing_address_2",
        shipping_phone_number: "some shipping_phone_number",
        customer_id: 42,
        enabled: true,
        shipping_country: "some shipping_country",
        billing_zip_code: "some billing_zip_code",
        shipping_last_name: "some shipping_last_name",
        reset_password: true,
        shipping_address_1: "some shipping_address_1",
        billing_city: "some billing_city",
        shipping_zipcode: "some shipping_zipcode"
      })
      |> Api.Customers.create_customer()

    customer
  end
end
