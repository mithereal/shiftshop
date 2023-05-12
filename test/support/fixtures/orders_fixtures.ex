defmodule Api.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        order_item_list: "some order_item_list",
        transaction_list: 120.5,
        question_list: "some question_list",
        order_status_id: "some order_status_id",
        card_type: "some card_type",
        billing_state: "some billing_state",
        customer_comments: "some customer_comments",
        continue_url: "some continue_url",
        invoice_number: 42,
        card_address: "some card_address",
        order_date: "some order_date",
        billing_last_name: "some billing_last_name",
        billing_payment_method_id: "some billing_payment_method_id",
        billing_on_line_payment: "some billing_on_line_payment",
        payment_token_id: "some payment_token_id",
        affiliate_commission: 120.5,
        billing_email: "some billing_email",
        alternate_order_id: "some alternate_order_id",
        billing_phone_number: "some billing_phone_number",
        card_name: "some card_name",
        ip: "some ip",
        billing_company: "some billing_company",
        sales_person: "some sales_person",
        invoice_number_prefix: "some invoice_number_prefix",
        last_update: "some last_update",
        card_start_month: "some card_start_month",
        sales_tax_3: 120.5,
        card_number: "some card_number",
        billing_payment_method: "some billing_payment_method",
        card_expiration_year: "some card_expiration_year",
        customer_id: 42,
        billing_zip_code: "some billing_zip_code",
        external_comments: "some external_comments",
        order_amount: 120.5,
        promotion_list: "some promotion_list",
        billing_country: "some billing_country",
        card_verification: "some card_verification",
        order_type: "some order_type",
        shipment_list: "some shipment_list",
        order_discount_promotion: 120.5,
        order_id: 42,
        billing_first_name: "some billing_first_name",
        billing_address_2: "some billing_address_2",
        user_id: "some user_id",
        sales_tax: 120.5,
        reward_points: "some reward_points",
        order_discount: 120.5,
        referer: "some referer",
        billing_city: "some billing_city",
        card_start_year: "some card_start_year",
        billing_address: "some billing_address",
        order_discount_coupon: 120.5,
        internal_comments: "some internal_comments",
        card_expiration_month: "some card_expiration_month",
        sales_tax_2: 120.5,
        card_issue_number: "some card_issue_number"
      })
      |> Api.Orders.create_order()

    order
  end
end
