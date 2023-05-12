defmodule Api.OrdersTest do
  use Api.DataCase

  alias Api.Orders

  describe "orders" do
    alias Api.Orders.Order

    import Api.OrdersFixtures

    @invalid_attrs %{card_issue_number: nil, sales_tax_2: nil, card_expiration_month: nil, internal_comments: nil, order_discount_coupon: nil, billing_address: nil, card_start_year: nil, billing_city: nil, referer: nil, order_discount: nil, reward_points: nil, sales_tax: nil, user_id: nil, billing_address_2: nil, billing_first_name: nil, order_id: nil, order_discount_promotion: nil, shipment_list: nil, order_type: nil, card_verification: nil, billing_country: nil, promotion_list: nil, order_amount: nil, external_comments: nil, billing_zip_code: nil, customer_id: nil, card_expiration_year: nil, billing_payment_method: nil, card_number: nil, sales_tax_3: nil, card_start_month: nil, last_update: nil, invoice_number_prefix: nil, sales_person: nil, billing_company: nil, ip: nil, card_name: nil, billing_phone_number: nil, alternate_order_id: nil, billing_email: nil, affiliate_commission: nil, payment_token_id: nil, billing_on_line_payment: nil, billing_payment_method_id: nil, billing_last_name: nil, order_date: nil, card_address: nil, invoice_number: nil, continue_url: nil, customer_comments: nil, billing_state: nil, card_type: nil, order_status_id: nil, question_list: nil, transaction_list: nil, order_item_list: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{card_issue_number: "some card_issue_number", sales_tax_2: 120.5, card_expiration_month: "some card_expiration_month", internal_comments: "some internal_comments", order_discount_coupon: 120.5, billing_address: "some billing_address", card_start_year: "some card_start_year", billing_city: "some billing_city", referer: "some referer", order_discount: 120.5, reward_points: "some reward_points", sales_tax: 120.5, user_id: "some user_id", billing_address_2: "some billing_address_2", billing_first_name: "some billing_first_name", order_id: 42, order_discount_promotion: 120.5, shipment_list: "some shipment_list", order_type: "some order_type", card_verification: "some card_verification", billing_country: "some billing_country", promotion_list: "some promotion_list", order_amount: 120.5, external_comments: "some external_comments", billing_zip_code: "some billing_zip_code", customer_id: 42, card_expiration_year: "some card_expiration_year", billing_payment_method: "some billing_payment_method", card_number: "some card_number", sales_tax_3: 120.5, card_start_month: "some card_start_month", last_update: "some last_update", invoice_number_prefix: "some invoice_number_prefix", sales_person: "some sales_person", billing_company: "some billing_company", ip: "some ip", card_name: "some card_name", billing_phone_number: "some billing_phone_number", alternate_order_id: "some alternate_order_id", billing_email: "some billing_email", affiliate_commission: 120.5, payment_token_id: "some payment_token_id", billing_on_line_payment: "some billing_on_line_payment", billing_payment_method_id: "some billing_payment_method_id", billing_last_name: "some billing_last_name", order_date: "some order_date", card_address: "some card_address", invoice_number: 42, continue_url: "some continue_url", customer_comments: "some customer_comments", billing_state: "some billing_state", card_type: "some card_type", order_status_id: "some order_status_id", question_list: "some question_list", transaction_list: 120.5, order_item_list: "some order_item_list"}

      assert {:ok, %Order{} = order} = Orders.create_order(valid_attrs)
      assert order.order_item_list == "some order_item_list"
      assert order.transaction_list == 120.5
      assert order.question_list == "some question_list"
      assert order.order_status_id == "some order_status_id"
      assert order.card_type == "some card_type"
      assert order.billing_state == "some billing_state"
      assert order.customer_comments == "some customer_comments"
      assert order.continue_url == "some continue_url"
      assert order.invoice_number == 42
      assert order.card_address == "some card_address"
      assert order.order_date == "some order_date"
      assert order.billing_last_name == "some billing_last_name"
      assert order.billing_payment_method_id == "some billing_payment_method_id"
      assert order.billing_on_line_payment == "some billing_on_line_payment"
      assert order.payment_token_id == "some payment_token_id"
      assert order.affiliate_commission == 120.5
      assert order.billing_email == "some billing_email"
      assert order.alternate_order_id == "some alternate_order_id"
      assert order.billing_phone_number == "some billing_phone_number"
      assert order.card_name == "some card_name"
      assert order.ip == "some ip"
      assert order.billing_company == "some billing_company"
      assert order.sales_person == "some sales_person"
      assert order.invoice_number_prefix == "some invoice_number_prefix"
      assert order.last_update == "some last_update"
      assert order.card_start_month == "some card_start_month"
      assert order.sales_tax_3 == 120.5
      assert order.card_number == "some card_number"
      assert order.billing_payment_method == "some billing_payment_method"
      assert order.card_expiration_year == "some card_expiration_year"
      assert order.customer_id == 42
      assert order.billing_zip_code == "some billing_zip_code"
      assert order.external_comments == "some external_comments"
      assert order.order_amount == 120.5
      assert order.promotion_list == "some promotion_list"
      assert order.billing_country == "some billing_country"
      assert order.card_verification == "some card_verification"
      assert order.order_type == "some order_type"
      assert order.shipment_list == "some shipment_list"
      assert order.order_discount_promotion == 120.5
      assert order.order_id == 42
      assert order.billing_first_name == "some billing_first_name"
      assert order.billing_address_2 == "some billing_address_2"
      assert order.user_id == "some user_id"
      assert order.sales_tax == 120.5
      assert order.reward_points == "some reward_points"
      assert order.order_discount == 120.5
      assert order.referer == "some referer"
      assert order.billing_city == "some billing_city"
      assert order.card_start_year == "some card_start_year"
      assert order.billing_address == "some billing_address"
      assert order.order_discount_coupon == 120.5
      assert order.internal_comments == "some internal_comments"
      assert order.card_expiration_month == "some card_expiration_month"
      assert order.sales_tax_2 == 120.5
      assert order.card_issue_number == "some card_issue_number"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{card_issue_number: "some updated card_issue_number", sales_tax_2: 456.7, card_expiration_month: "some updated card_expiration_month", internal_comments: "some updated internal_comments", order_discount_coupon: 456.7, billing_address: "some updated billing_address", card_start_year: "some updated card_start_year", billing_city: "some updated billing_city", referer: "some updated referer", order_discount: 456.7, reward_points: "some updated reward_points", sales_tax: 456.7, user_id: "some updated user_id", billing_address_2: "some updated billing_address_2", billing_first_name: "some updated billing_first_name", order_id: 43, order_discount_promotion: 456.7, shipment_list: "some updated shipment_list", order_type: "some updated order_type", card_verification: "some updated card_verification", billing_country: "some updated billing_country", promotion_list: "some updated promotion_list", order_amount: 456.7, external_comments: "some updated external_comments", billing_zip_code: "some updated billing_zip_code", customer_id: 43, card_expiration_year: "some updated card_expiration_year", billing_payment_method: "some updated billing_payment_method", card_number: "some updated card_number", sales_tax_3: 456.7, card_start_month: "some updated card_start_month", last_update: "some updated last_update", invoice_number_prefix: "some updated invoice_number_prefix", sales_person: "some updated sales_person", billing_company: "some updated billing_company", ip: "some updated ip", card_name: "some updated card_name", billing_phone_number: "some updated billing_phone_number", alternate_order_id: "some updated alternate_order_id", billing_email: "some updated billing_email", affiliate_commission: 456.7, payment_token_id: "some updated payment_token_id", billing_on_line_payment: "some updated billing_on_line_payment", billing_payment_method_id: "some updated billing_payment_method_id", billing_last_name: "some updated billing_last_name", order_date: "some updated order_date", card_address: "some updated card_address", invoice_number: 43, continue_url: "some updated continue_url", customer_comments: "some updated customer_comments", billing_state: "some updated billing_state", card_type: "some updated card_type", order_status_id: "some updated order_status_id", question_list: "some updated question_list", transaction_list: 456.7, order_item_list: "some updated order_item_list"}

      assert {:ok, %Order{} = order} = Orders.update_order(order, update_attrs)
      assert order.order_item_list == "some updated order_item_list"
      assert order.transaction_list == 456.7
      assert order.question_list == "some updated question_list"
      assert order.order_status_id == "some updated order_status_id"
      assert order.card_type == "some updated card_type"
      assert order.billing_state == "some updated billing_state"
      assert order.customer_comments == "some updated customer_comments"
      assert order.continue_url == "some updated continue_url"
      assert order.invoice_number == 43
      assert order.card_address == "some updated card_address"
      assert order.order_date == "some updated order_date"
      assert order.billing_last_name == "some updated billing_last_name"
      assert order.billing_payment_method_id == "some updated billing_payment_method_id"
      assert order.billing_on_line_payment == "some updated billing_on_line_payment"
      assert order.payment_token_id == "some updated payment_token_id"
      assert order.affiliate_commission == 456.7
      assert order.billing_email == "some updated billing_email"
      assert order.alternate_order_id == "some updated alternate_order_id"
      assert order.billing_phone_number == "some updated billing_phone_number"
      assert order.card_name == "some updated card_name"
      assert order.ip == "some updated ip"
      assert order.billing_company == "some updated billing_company"
      assert order.sales_person == "some updated sales_person"
      assert order.invoice_number_prefix == "some updated invoice_number_prefix"
      assert order.last_update == "some updated last_update"
      assert order.card_start_month == "some updated card_start_month"
      assert order.sales_tax_3 == 456.7
      assert order.card_number == "some updated card_number"
      assert order.billing_payment_method == "some updated billing_payment_method"
      assert order.card_expiration_year == "some updated card_expiration_year"
      assert order.customer_id == 43
      assert order.billing_zip_code == "some updated billing_zip_code"
      assert order.external_comments == "some updated external_comments"
      assert order.order_amount == 456.7
      assert order.promotion_list == "some updated promotion_list"
      assert order.billing_country == "some updated billing_country"
      assert order.card_verification == "some updated card_verification"
      assert order.order_type == "some updated order_type"
      assert order.shipment_list == "some updated shipment_list"
      assert order.order_discount_promotion == 456.7
      assert order.order_id == 43
      assert order.billing_first_name == "some updated billing_first_name"
      assert order.billing_address_2 == "some updated billing_address_2"
      assert order.user_id == "some updated user_id"
      assert order.sales_tax == 456.7
      assert order.reward_points == "some updated reward_points"
      assert order.order_discount == 456.7
      assert order.referer == "some updated referer"
      assert order.billing_city == "some updated billing_city"
      assert order.card_start_year == "some updated card_start_year"
      assert order.billing_address == "some updated billing_address"
      assert order.order_discount_coupon == 456.7
      assert order.internal_comments == "some updated internal_comments"
      assert order.card_expiration_month == "some updated card_expiration_month"
      assert order.sales_tax_2 == 456.7
      assert order.card_issue_number == "some updated card_issue_number"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
