defmodule ApiWeb.CustomerLiveTest do
  use ApiWeb.ConnCase

  import Phoenix.LiveViewTest
  import Api.SwiftshopFixtures

  @create_attrs %{additional_field_3: "some additional_field_3", shipping_last_name: "some shipping_last_name", shipping_address_2: "some shipping_address_2", additional_field_2: "some additional_field_2", reset_password: true, billing_address_2: "some billing_address_2", shipping_address_1: "some shipping_address_1", enabled: true, billing_taxid: "some billing_taxid", billing_company: "some billing_company", total_store_credit: 120.5, non_taxable: true, billing_country: "some billing_country", shipping_zipcode: "some shipping_zipcode", additional_field_1: "some additional_field_1", shipping_state: "some shipping_state", billing_first_name: "some billing_first_name", shipping_address_type: 42, customer_id: 42, billing_city: "some billing_city", shipping_first_name: "some shipping_first_name", shipping_country: "some shipping_country", password: "some password", billing_zip_code: "some billing_zip_code", shipping_phone_number: "some shipping_phone_number", billing_phone_number: "some billing_phone_number", customer_group_id: 42, mail_list: true, shipping_company: "some shipping_company", billing_last_name: "some billing_last_name", email: "some email", billing_state: "some billing_state", shipping_city: "some shipping_city", comments: "some comments", billing_address_1: "some billing_address_1", disable_billing_same_as_shipping: true}
  @update_attrs %{additional_field_3: "some updated additional_field_3", shipping_last_name: "some updated shipping_last_name", shipping_address_2: "some updated shipping_address_2", additional_field_2: "some updated additional_field_2", reset_password: false, billing_address_2: "some updated billing_address_2", shipping_address_1: "some updated shipping_address_1", enabled: false, billing_taxid: "some updated billing_taxid", billing_company: "some updated billing_company", total_store_credit: 456.7, non_taxable: false, billing_country: "some updated billing_country", shipping_zipcode: "some updated shipping_zipcode", additional_field_1: "some updated additional_field_1", shipping_state: "some updated shipping_state", billing_first_name: "some updated billing_first_name", shipping_address_type: 43, customer_id: 43, billing_city: "some updated billing_city", shipping_first_name: "some updated shipping_first_name", shipping_country: "some updated shipping_country", password: "some updated password", billing_zip_code: "some updated billing_zip_code", shipping_phone_number: "some updated shipping_phone_number", billing_phone_number: "some updated billing_phone_number", customer_group_id: 43, mail_list: false, shipping_company: "some updated shipping_company", billing_last_name: "some updated billing_last_name", email: "some updated email", billing_state: "some updated billing_state", shipping_city: "some updated shipping_city", comments: "some updated comments", billing_address_1: "some updated billing_address_1", disable_billing_same_as_shipping: false}
  @invalid_attrs %{additional_field_3: nil, shipping_last_name: nil, shipping_address_2: nil, additional_field_2: nil, reset_password: false, billing_address_2: nil, shipping_address_1: nil, enabled: false, billing_taxid: nil, billing_company: nil, total_store_credit: nil, non_taxable: false, billing_country: nil, shipping_zipcode: nil, additional_field_1: nil, shipping_state: nil, billing_first_name: nil, shipping_address_type: nil, customer_id: nil, billing_city: nil, shipping_first_name: nil, shipping_country: nil, password: nil, billing_zip_code: nil, shipping_phone_number: nil, billing_phone_number: nil, customer_group_id: nil, mail_list: false, shipping_company: nil, billing_last_name: nil, email: nil, billing_state: nil, shipping_city: nil, comments: nil, billing_address_1: nil, disable_billing_same_as_shipping: false}

  defp create_customer(_) do
    customer = customer_fixture()
    %{customer: customer}
  end

  describe "Index" do
    setup [:create_customer]

    test "lists all customer", %{conn: conn, customer: customer} do
      {:ok, _index_live, html} = live(conn, ~p"/customer")

      assert html =~ "Listing Customer"
      assert html =~ customer.additional_field_3
    end

    test "saves new customer", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/customer")

      assert index_live |> element("a", "New Customer") |> render_click() =~
               "New Customer"

      assert_patch(index_live, ~p"/customer/new")

      assert index_live
             |> form("#customer-form", customer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#customer-form", customer: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/customer")

      html = render(index_live)
      assert html =~ "Customer created successfully"
      assert html =~ "some additional_field_3"
    end

    test "updates customer in listing", %{conn: conn, customer: customer} do
      {:ok, index_live, _html} = live(conn, ~p"/customer")

      assert index_live |> element("#customer-#{customer.id} a", "Edit") |> render_click() =~
               "Edit Customer"

      assert_patch(index_live, ~p"/customer/#{customer}/edit")

      assert index_live
             |> form("#customer-form", customer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#customer-form", customer: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/customer")

      html = render(index_live)
      assert html =~ "Customer updated successfully"
      assert html =~ "some updated additional_field_3"
    end

    test "deletes customer in listing", %{conn: conn, customer: customer} do
      {:ok, index_live, _html} = live(conn, ~p"/customer")

      assert index_live |> element("#customer-#{customer.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#customer-#{customer.id}")
    end
  end

  describe "Show" do
    setup [:create_customer]

    test "displays customer", %{conn: conn, customer: customer} do
      {:ok, _show_live, html} = live(conn, ~p"/customer/#{customer}")

      assert html =~ "Show Customer"
      assert html =~ customer.additional_field_3
    end

    test "updates customer within modal", %{conn: conn, customer: customer} do
      {:ok, show_live, _html} = live(conn, ~p"/customer/#{customer}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Customer"

      assert_patch(show_live, ~p"/customer/#{customer}/show/edit")

      assert show_live
             |> form("#customer-form", customer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#customer-form", customer: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/customer/#{customer}")

      html = render(show_live)
      assert html =~ "Customer updated successfully"
      assert html =~ "some updated additional_field_3"
    end
  end
end
