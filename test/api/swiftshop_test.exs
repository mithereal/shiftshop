defmodule Api.SwiftshopTest do
  use Api.DataCase

  alias Api.Swiftshop

  describe "customer" do
    alias Api.Swiftshop.Customer

    import Api.SwiftshopFixtures

    @invalid_attrs %{
      additional_field_3: nil,
      shipping_last_name: nil,
      shipping_address_2: nil,
      additional_field_2: nil,
      reset_password: nil,
      billing_address_2: nil,
      shipping_address_1: nil,
      enabled: nil,
      billing_taxid: nil,
      billing_company: nil,
      total_store_credit: nil,
      non_taxable: nil,
      billing_country: nil,
      shipping_zipcode: nil,
      additional_field_1: nil,
      shipping_state: nil,
      billing_first_name: nil,
      shipping_address_type: nil,
      customer_id: nil,
      billing_city: nil,
      shipping_first_name: nil,
      shipping_country: nil,
      password: nil,
      billing_zip_code: nil,
      shipping_phone_number: nil,
      billing_phone_number: nil,
      customer_group_id: nil,
      mail_list: nil,
      shipping_company: nil,
      billing_last_name: nil,
      email: nil,
      billing_state: nil,
      shipping_city: nil,
      comments: nil,
      billing_address_1: nil,
      disable_billing_same_as_shipping: nil
    }

    test "list_customer/0 returns all customer" do
      customer = customer_fixture()
      assert Swiftshop.list_customer() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Swiftshop.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{
        additional_field_3: "some additional_field_3",
        shipping_last_name: "some shipping_last_name",
        shipping_address_2: "some shipping_address_2",
        additional_field_2: "some additional_field_2",
        reset_password: true,
        billing_address_2: "some billing_address_2",
        shipping_address_1: "some shipping_address_1",
        enabled: true,
        billing_taxid: "some billing_taxid",
        billing_company: "some billing_company",
        total_store_credit: 120.5,
        non_taxable: true,
        billing_country: "some billing_country",
        shipping_zipcode: "some shipping_zipcode",
        additional_field_1: "some additional_field_1",
        shipping_state: "some shipping_state",
        billing_first_name: "some billing_first_name",
        shipping_address_type: 42,
        customer_id: 42,
        billing_city: "some billing_city",
        shipping_first_name: "some shipping_first_name",
        shipping_country: "some shipping_country",
        password: "some password",
        billing_zip_code: "some billing_zip_code",
        shipping_phone_number: "some shipping_phone_number",
        billing_phone_number: "some billing_phone_number",
        customer_group_id: 42,
        mail_list: true,
        shipping_company: "some shipping_company",
        billing_last_name: "some billing_last_name",
        email: "some email",
        billing_state: "some billing_state",
        shipping_city: "some shipping_city",
        comments: "some comments",
        billing_address_1: "some billing_address_1",
        disable_billing_same_as_shipping: true
      }

      assert {:ok, %Customer{} = customer} = Swiftshop.create_customer(valid_attrs)
      assert customer.disable_billing_same_as_shipping == true
      assert customer.billing_address_1 == "some billing_address_1"
      assert customer.comments == "some comments"
      assert customer.shipping_city == "some shipping_city"
      assert customer.billing_state == "some billing_state"
      assert customer.email == "some email"
      assert customer.billing_last_name == "some billing_last_name"
      assert customer.shipping_company == "some shipping_company"
      assert customer.mail_list == true
      assert customer.customer_group_id == 42
      assert customer.billing_phone_number == "some billing_phone_number"
      assert customer.shipping_phone_number == "some shipping_phone_number"
      assert customer.billing_zip_code == "some billing_zip_code"
      assert customer.password == "some password"
      assert customer.shipping_country == "some shipping_country"
      assert customer.shipping_first_name == "some shipping_first_name"
      assert customer.billing_city == "some billing_city"
      assert customer.customer_id == 42
      assert customer.shipping_address_type == 42
      assert customer.billing_first_name == "some billing_first_name"
      assert customer.shipping_state == "some shipping_state"
      assert customer.additional_field_1 == "some additional_field_1"
      assert customer.shipping_zipcode == "some shipping_zipcode"
      assert customer.billing_country == "some billing_country"
      assert customer.non_taxable == true
      assert customer.total_store_credit == 120.5
      assert customer.billing_company == "some billing_company"
      assert customer.billing_taxid == "some billing_taxid"
      assert customer.enabled == true
      assert customer.shipping_address_1 == "some shipping_address_1"
      assert customer.billing_address_2 == "some billing_address_2"
      assert customer.reset_password == true
      assert customer.additional_field_2 == "some additional_field_2"
      assert customer.shipping_address_2 == "some shipping_address_2"
      assert customer.shipping_last_name == "some shipping_last_name"
      assert customer.additional_field_3 == "some additional_field_3"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Swiftshop.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()

      update_attrs = %{
        additional_field_3: "some updated additional_field_3",
        shipping_last_name: "some updated shipping_last_name",
        shipping_address_2: "some updated shipping_address_2",
        additional_field_2: "some updated additional_field_2",
        reset_password: false,
        billing_address_2: "some updated billing_address_2",
        shipping_address_1: "some updated shipping_address_1",
        enabled: false,
        billing_taxid: "some updated billing_taxid",
        billing_company: "some updated billing_company",
        total_store_credit: 456.7,
        non_taxable: false,
        billing_country: "some updated billing_country",
        shipping_zipcode: "some updated shipping_zipcode",
        additional_field_1: "some updated additional_field_1",
        shipping_state: "some updated shipping_state",
        billing_first_name: "some updated billing_first_name",
        shipping_address_type: 43,
        customer_id: 43,
        billing_city: "some updated billing_city",
        shipping_first_name: "some updated shipping_first_name",
        shipping_country: "some updated shipping_country",
        password: "some updated password",
        billing_zip_code: "some updated billing_zip_code",
        shipping_phone_number: "some updated shipping_phone_number",
        billing_phone_number: "some updated billing_phone_number",
        customer_group_id: 43,
        mail_list: false,
        shipping_company: "some updated shipping_company",
        billing_last_name: "some updated billing_last_name",
        email: "some updated email",
        billing_state: "some updated billing_state",
        shipping_city: "some updated shipping_city",
        comments: "some updated comments",
        billing_address_1: "some updated billing_address_1",
        disable_billing_same_as_shipping: false
      }

      assert {:ok, %Customer{} = customer} = Swiftshop.update_customer(customer, update_attrs)
      assert customer.disable_billing_same_as_shipping == false
      assert customer.billing_address_1 == "some updated billing_address_1"
      assert customer.comments == "some updated comments"
      assert customer.shipping_city == "some updated shipping_city"
      assert customer.billing_state == "some updated billing_state"
      assert customer.email == "some updated email"
      assert customer.billing_last_name == "some updated billing_last_name"
      assert customer.shipping_company == "some updated shipping_company"
      assert customer.mail_list == false
      assert customer.customer_group_id == 43
      assert customer.billing_phone_number == "some updated billing_phone_number"
      assert customer.shipping_phone_number == "some updated shipping_phone_number"
      assert customer.billing_zip_code == "some updated billing_zip_code"
      assert customer.password == "some updated password"
      assert customer.shipping_country == "some updated shipping_country"
      assert customer.shipping_first_name == "some updated shipping_first_name"
      assert customer.billing_city == "some updated billing_city"
      assert customer.customer_id == 43
      assert customer.shipping_address_type == 43
      assert customer.billing_first_name == "some updated billing_first_name"
      assert customer.shipping_state == "some updated shipping_state"
      assert customer.additional_field_1 == "some updated additional_field_1"
      assert customer.shipping_zipcode == "some updated shipping_zipcode"
      assert customer.billing_country == "some updated billing_country"
      assert customer.non_taxable == false
      assert customer.total_store_credit == 456.7
      assert customer.billing_company == "some updated billing_company"
      assert customer.billing_taxid == "some updated billing_taxid"
      assert customer.enabled == false
      assert customer.shipping_address_1 == "some updated shipping_address_1"
      assert customer.billing_address_2 == "some updated billing_address_2"
      assert customer.reset_password == false
      assert customer.additional_field_2 == "some updated additional_field_2"
      assert customer.shipping_address_2 == "some updated shipping_address_2"
      assert customer.shipping_last_name == "some updated shipping_last_name"
      assert customer.additional_field_3 == "some updated additional_field_3"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Swiftshop.update_customer(customer, @invalid_attrs)
      assert customer == Swiftshop.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Swiftshop.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Swiftshop.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Swiftshop.change_customer(customer)
    end
  end
end
