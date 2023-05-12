defmodule Api.SwiftshopFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Swiftshop` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        disable_billing_same_as_shipping: true,
        billing_address_1: "some billing_address_1",
        comments: "some comments",
        shipping_city: "some shipping_city",
        billing_state: "some billing_state",
        email: "some email",
        billing_last_name: "some billing_last_name",
        shipping_company: "some shipping_company",
        mail_list: true,
        customer_group_id: 42,
        billing_phone_number: "some billing_phone_number",
        shipping_phone_number: "some shipping_phone_number",
        billing_zip_code: "some billing_zip_code",
        password: "some password",
        shipping_country: "some shipping_country",
        shipping_first_name: "some shipping_first_name",
        billing_city: "some billing_city",
        customer_id: 42,
        shipping_address_type: 42,
        billing_first_name: "some billing_first_name",
        shipping_state: "some shipping_state",
        additional_field_1: "some additional_field_1",
        shipping_zipcode: "some shipping_zipcode",
        billing_country: "some billing_country",
        non_taxable: true,
        total_store_credit: 120.5,
        billing_company: "some billing_company",
        billing_taxid: "some billing_taxid",
        enabled: true,
        shipping_address_1: "some shipping_address_1",
        billing_address_2: "some billing_address_2",
        reset_password: true,
        additional_field_2: "some additional_field_2",
        shipping_address_2: "some shipping_address_2",
        shipping_last_name: "some shipping_last_name",
        additional_field_3: "some additional_field_3"
      })
      |> Api.Swiftshop.create_customer()

    customer
  end
end
