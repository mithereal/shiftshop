defmodule ApiWeb.CustomerLiveTest do
  use ApiWeb.ConnCase

  import Phoenix.LiveViewTest
  import Api.CustomersFixtures

  @create_attrs %{shipping_zipcode: "some shipping_zipcode", billing_city: "some billing_city", shipping_address_1: "some shipping_address_1", reset_password: true, shipping_last_name: "some shipping_last_name", billing_zip_code: "some billing_zip_code", shipping_country: "some shipping_country", enabled: true, customer_id: 42, shipping_phone_number: "some shipping_phone_number", billing_address_2: "some billing_address_2", shipping_address_2: "some shipping_address_2", shipping_city: "some shipping_city", shipping_company: "some shipping_company", billing_address_1: "some billing_address_1", additional_field_2: "some additional_field_2", total_store_credit: 120.5, additional_field_3: "some additional_field_3", non_taxable: true, billing_first_name: "some billing_first_name", billing_company: "some billing_company", shipping_first_name: "some shipping_first_name", disable_billing_same_as_shipping: true, shipping_state: "some shipping_state", email: "some email", billing_last_name: "some billing_last_name", shipping_address_type: 42, additional_field_1: "some additional_field_1", billing_phone_number: "some billing_phone_number", password: "some password", billing_taxid: "some billing_taxid", billing_state: "some billing_state", customer_group_id: 42, comments: "some comments", billing_country: "some billing_country", mail_list: true}
  @update_attrs %{shipping_zipcode: "some updated shipping_zipcode", billing_city: "some updated billing_city", shipping_address_1: "some updated shipping_address_1", reset_password: false, shipping_last_name: "some updated shipping_last_name", billing_zip_code: "some updated billing_zip_code", shipping_country: "some updated shipping_country", enabled: false, customer_id: 43, shipping_phone_number: "some updated shipping_phone_number", billing_address_2: "some updated billing_address_2", shipping_address_2: "some updated shipping_address_2", shipping_city: "some updated shipping_city", shipping_company: "some updated shipping_company", billing_address_1: "some updated billing_address_1", additional_field_2: "some updated additional_field_2", total_store_credit: 456.7, additional_field_3: "some updated additional_field_3", non_taxable: false, billing_first_name: "some updated billing_first_name", billing_company: "some updated billing_company", shipping_first_name: "some updated shipping_first_name", disable_billing_same_as_shipping: false, shipping_state: "some updated shipping_state", email: "some updated email", billing_last_name: "some updated billing_last_name", shipping_address_type: 43, additional_field_1: "some updated additional_field_1", billing_phone_number: "some updated billing_phone_number", password: "some updated password", billing_taxid: "some updated billing_taxid", billing_state: "some updated billing_state", customer_group_id: 43, comments: "some updated comments", billing_country: "some updated billing_country", mail_list: false}
  @invalid_attrs %{shipping_zipcode: nil, billing_city: nil, shipping_address_1: nil, reset_password: false, shipping_last_name: nil, billing_zip_code: nil, shipping_country: nil, enabled: false, customer_id: nil, shipping_phone_number: nil, billing_address_2: nil, shipping_address_2: nil, shipping_city: nil, shipping_company: nil, billing_address_1: nil, additional_field_2: nil, total_store_credit: nil, additional_field_3: nil, non_taxable: false, billing_first_name: nil, billing_company: nil, shipping_first_name: nil, disable_billing_same_as_shipping: false, shipping_state: nil, email: nil, billing_last_name: nil, shipping_address_type: nil, additional_field_1: nil, billing_phone_number: nil, password: nil, billing_taxid: nil, billing_state: nil, customer_group_id: nil, comments: nil, billing_country: nil, mail_list: false}

  defp create_customer(_) do
    customer = customer_fixture()
    %{customer: customer}
  end

  describe "Index" do
    setup [:create_customer]

    test "lists all customers", %{conn: conn, customer: customer} do
      {:ok, _index_live, html} = live(conn, ~p"/customers")

      assert html =~ "Listing Customers"
      assert html =~ customer.shipping_zipcode
    end

    test "saves new customer", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/customers")

      assert index_live |> element("a", "New Customer") |> render_click() =~
               "New Customer"

      assert_patch(index_live, ~p"/customers/new")

      assert index_live
             |> form("#customer-form", customer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#customer-form", customer: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/customers")

      html = render(index_live)
      assert html =~ "Customer created successfully"
      assert html =~ "some shipping_zipcode"
    end

    test "updates customer in listing", %{conn: conn, customer: customer} do
      {:ok, index_live, _html} = live(conn, ~p"/customers")

      assert index_live |> element("#customers-#{customer.id} a", "Edit") |> render_click() =~
               "Edit Customer"

      assert_patch(index_live, ~p"/customers/#{customer}/edit")

      assert index_live
             |> form("#customer-form", customer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#customer-form", customer: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/customers")

      html = render(index_live)
      assert html =~ "Customer updated successfully"
      assert html =~ "some updated shipping_zipcode"
    end

    test "deletes customer in listing", %{conn: conn, customer: customer} do
      {:ok, index_live, _html} = live(conn, ~p"/customers")

      assert index_live |> element("#customers-#{customer.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#customers-#{customer.id}")
    end
  end

  describe "Show" do
    setup [:create_customer]

    test "displays customer", %{conn: conn, customer: customer} do
      {:ok, _show_live, html} = live(conn, ~p"/customers/#{customer}")

      assert html =~ "Show Customer"
      assert html =~ customer.shipping_zipcode
    end

    test "updates customer within modal", %{conn: conn, customer: customer} do
      {:ok, show_live, _html} = live(conn, ~p"/customers/#{customer}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Customer"

      assert_patch(show_live, ~p"/customers/#{customer}/show/edit")

      assert show_live
             |> form("#customer-form", customer: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#customer-form", customer: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/customers/#{customer}")

      html = render(show_live)
      assert html =~ "Customer updated successfully"
      assert html =~ "some updated shipping_zipcode"
    end
  end
end
