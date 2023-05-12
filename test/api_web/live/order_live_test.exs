defmodule ApiWeb.OrderLiveTest do
  use ApiWeb.ConnCase

  import Phoenix.LiveViewTest
  import Api.OrdersFixtures

  @create_attrs %{
    card_issue_number: "some card_issue_number",
    sales_tax_2: 120.5,
    card_expiration_month: "some card_expiration_month",
    internal_comments: "some internal_comments",
    order_discount_coupon: 120.5,
    billing_address: "some billing_address",
    card_start_year: "some card_start_year",
    billing_city: "some billing_city",
    referer: "some referer",
    order_discount: 120.5,
    reward_points: "some reward_points",
    sales_tax: 120.5,
    user_id: "some user_id",
    billing_address_2: "some billing_address_2",
    billing_first_name: "some billing_first_name",
    order_id: 42,
    order_discount_promotion: 120.5,
    shipment_list: "some shipment_list",
    order_type: "some order_type",
    card_verification: "some card_verification",
    billing_country: "some billing_country",
    promotion_list: "some promotion_list",
    order_amount: 120.5,
    external_comments: "some external_comments",
    billing_zip_code: "some billing_zip_code",
    customer_id: 42,
    card_expiration_year: "some card_expiration_year",
    billing_payment_method: "some billing_payment_method",
    card_number: "some card_number",
    sales_tax_3: 120.5,
    card_start_month: "some card_start_month",
    last_update: "some last_update",
    invoice_number_prefix: "some invoice_number_prefix",
    sales_person: "some sales_person",
    billing_company: "some billing_company",
    ip: "some ip",
    card_name: "some card_name",
    billing_phone_number: "some billing_phone_number",
    alternate_order_id: "some alternate_order_id",
    billing_email: "some billing_email",
    affiliate_commission: 120.5,
    payment_token_id: "some payment_token_id",
    billing_on_line_payment: "some billing_on_line_payment",
    billing_payment_method_id: "some billing_payment_method_id",
    billing_last_name: "some billing_last_name",
    order_date: "some order_date",
    card_address: "some card_address",
    invoice_number: 42,
    continue_url: "some continue_url",
    customer_comments: "some customer_comments",
    billing_state: "some billing_state",
    card_type: "some card_type",
    order_status_id: "some order_status_id",
    question_list: "some question_list",
    transaction_list: 120.5,
    order_item_list: "some order_item_list"
  }
  @update_attrs %{
    card_issue_number: "some updated card_issue_number",
    sales_tax_2: 456.7,
    card_expiration_month: "some updated card_expiration_month",
    internal_comments: "some updated internal_comments",
    order_discount_coupon: 456.7,
    billing_address: "some updated billing_address",
    card_start_year: "some updated card_start_year",
    billing_city: "some updated billing_city",
    referer: "some updated referer",
    order_discount: 456.7,
    reward_points: "some updated reward_points",
    sales_tax: 456.7,
    user_id: "some updated user_id",
    billing_address_2: "some updated billing_address_2",
    billing_first_name: "some updated billing_first_name",
    order_id: 43,
    order_discount_promotion: 456.7,
    shipment_list: "some updated shipment_list",
    order_type: "some updated order_type",
    card_verification: "some updated card_verification",
    billing_country: "some updated billing_country",
    promotion_list: "some updated promotion_list",
    order_amount: 456.7,
    external_comments: "some updated external_comments",
    billing_zip_code: "some updated billing_zip_code",
    customer_id: 43,
    card_expiration_year: "some updated card_expiration_year",
    billing_payment_method: "some updated billing_payment_method",
    card_number: "some updated card_number",
    sales_tax_3: 456.7,
    card_start_month: "some updated card_start_month",
    last_update: "some updated last_update",
    invoice_number_prefix: "some updated invoice_number_prefix",
    sales_person: "some updated sales_person",
    billing_company: "some updated billing_company",
    ip: "some updated ip",
    card_name: "some updated card_name",
    billing_phone_number: "some updated billing_phone_number",
    alternate_order_id: "some updated alternate_order_id",
    billing_email: "some updated billing_email",
    affiliate_commission: 456.7,
    payment_token_id: "some updated payment_token_id",
    billing_on_line_payment: "some updated billing_on_line_payment",
    billing_payment_method_id: "some updated billing_payment_method_id",
    billing_last_name: "some updated billing_last_name",
    order_date: "some updated order_date",
    card_address: "some updated card_address",
    invoice_number: 43,
    continue_url: "some updated continue_url",
    customer_comments: "some updated customer_comments",
    billing_state: "some updated billing_state",
    card_type: "some updated card_type",
    order_status_id: "some updated order_status_id",
    question_list: "some updated question_list",
    transaction_list: 456.7,
    order_item_list: "some updated order_item_list"
  }
  @invalid_attrs %{
    card_issue_number: nil,
    sales_tax_2: nil,
    card_expiration_month: nil,
    internal_comments: nil,
    order_discount_coupon: nil,
    billing_address: nil,
    card_start_year: nil,
    billing_city: nil,
    referer: nil,
    order_discount: nil,
    reward_points: nil,
    sales_tax: nil,
    user_id: nil,
    billing_address_2: nil,
    billing_first_name: nil,
    order_id: nil,
    order_discount_promotion: nil,
    shipment_list: nil,
    order_type: nil,
    card_verification: nil,
    billing_country: nil,
    promotion_list: nil,
    order_amount: nil,
    external_comments: nil,
    billing_zip_code: nil,
    customer_id: nil,
    card_expiration_year: nil,
    billing_payment_method: nil,
    card_number: nil,
    sales_tax_3: nil,
    card_start_month: nil,
    last_update: nil,
    invoice_number_prefix: nil,
    sales_person: nil,
    billing_company: nil,
    ip: nil,
    card_name: nil,
    billing_phone_number: nil,
    alternate_order_id: nil,
    billing_email: nil,
    affiliate_commission: nil,
    payment_token_id: nil,
    billing_on_line_payment: nil,
    billing_payment_method_id: nil,
    billing_last_name: nil,
    order_date: nil,
    card_address: nil,
    invoice_number: nil,
    continue_url: nil,
    customer_comments: nil,
    billing_state: nil,
    card_type: nil,
    order_status_id: nil,
    question_list: nil,
    transaction_list: nil,
    order_item_list: nil
  }

  defp create_order(_) do
    order = order_fixture()
    %{order: order}
  end

  describe "Index" do
    setup [:create_order]

    test "lists all orders", %{conn: conn, order: order} do
      {:ok, _index_live, html} = live(conn, ~p"/orders")

      assert html =~ "Listing Orders"
      assert html =~ order.card_issue_number
    end

    test "saves new order", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/orders")

      assert index_live |> element("a", "New Order") |> render_click() =~
               "New Order"

      assert_patch(index_live, ~p"/orders/new")

      assert index_live
             |> form("#order-form", order: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#order-form", order: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/orders")

      html = render(index_live)
      assert html =~ "Order created successfully"
      assert html =~ "some card_issue_number"
    end

    test "updates order in listing", %{conn: conn, order: order} do
      {:ok, index_live, _html} = live(conn, ~p"/orders")

      assert index_live |> element("#orders-#{order.id} a", "Edit") |> render_click() =~
               "Edit Order"

      assert_patch(index_live, ~p"/orders/#{order}/edit")

      assert index_live
             |> form("#order-form", order: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#order-form", order: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/orders")

      html = render(index_live)
      assert html =~ "Order updated successfully"
      assert html =~ "some updated card_issue_number"
    end

    test "deletes order in listing", %{conn: conn, order: order} do
      {:ok, index_live, _html} = live(conn, ~p"/orders")

      assert index_live |> element("#orders-#{order.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#orders-#{order.id}")
    end
  end

  describe "Show" do
    setup [:create_order]

    test "displays order", %{conn: conn, order: order} do
      {:ok, _show_live, html} = live(conn, ~p"/orders/#{order}")

      assert html =~ "Show Order"
      assert html =~ order.card_issue_number
    end

    test "updates order within modal", %{conn: conn, order: order} do
      {:ok, show_live, _html} = live(conn, ~p"/orders/#{order}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Order"

      assert_patch(show_live, ~p"/orders/#{order}/show/edit")

      assert show_live
             |> form("#order-form", order: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#order-form", order: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/orders/#{order}")

      html = render(show_live)
      assert html =~ "Order updated successfully"
      assert html =~ "some updated card_issue_number"
    end
  end
end
