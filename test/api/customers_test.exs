defmodule Api.CustomersTest do
  use Api.DataCase

  alias Api.Customers

  describe "customer" do
    alias Api.Customers.Customer

    import Api.CustomersFixtures

    @invalid_attrs %{shipping_zipcode: nil, billing_city: nil, shipping_address_1: nil, reset_password: nil, shipping_last_name: nil, billing_zip_code: nil, shipping_country: nil, enabled: nil, customer_id: nil, shipping_phone_number: nil, billing_address_2: nil, shipping_address_2: nil, shipping_city: nil, shipping_company: nil, billing_address_1: nil, additional_field_2: nil, total_store_credit: nil, additional_field_3: nil, non_taxable: nil, billing_first_name: nil, billing_company: nil, shipping_first_name: nil, disable_billing_same_as_shipping: nil, shipping_state: nil, email: nil, billing_last_name: nil, shipping_address_type: nil, additional_field_1: nil, billing_phone_number: nil, password: nil, billing_taxid: nil, billing_state: nil, customer_group_id: nil, comments: nil, billing_country: nil, mail_list: nil}

    test "list_customer/0 returns all customer" do
      customer = customer_fixture()
      assert Customers.list_customer() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Customers.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{shipping_zipcode: "some shipping_zipcode", billing_city: "some billing_city", shipping_address_1: "some shipping_address_1", reset_password: true, shipping_last_name: "some shipping_last_name", billing_zip_code: "some billing_zip_code", shipping_country: "some shipping_country", enabled: true, customer_id: 42, shipping_phone_number: "some shipping_phone_number", billing_address_2: "some billing_address_2", shipping_address_2: "some shipping_address_2", shipping_city: "some shipping_city", shipping_company: "some shipping_company", billing_address_1: "some billing_address_1", additional_field_2: "some additional_field_2", total_store_credit: 120.5, additional_field_3: "some additional_field_3", non_taxable: true, billing_first_name: "some billing_first_name", billing_company: "some billing_company", shipping_first_name: "some shipping_first_name", disable_billing_same_as_shipping: true, shipping_state: "some shipping_state", email: "some email", billing_last_name: "some billing_last_name", shipping_address_type: 42, additional_field_1: "some additional_field_1", billing_phone_number: "some billing_phone_number", password: "some password", billing_taxid: "some billing_taxid", billing_state: "some billing_state", customer_group_id: 42, comments: "some comments", billing_country: "some billing_country", mail_list: true}

      assert {:ok, %Customer{} = customer} = Customers.create_customer(valid_attrs)
      assert customer.mail_list == true
      assert customer.billing_country == "some billing_country"
      assert customer.comments == "some comments"
      assert customer.customer_group_id == 42
      assert customer.billing_state == "some billing_state"
      assert customer.billing_taxid == "some billing_taxid"
      assert customer.password == "some password"
      assert customer.billing_phone_number == "some billing_phone_number"
      assert customer.additional_field_1 == "some additional_field_1"
      assert customer.shipping_address_type == 42
      assert customer.billing_last_name == "some billing_last_name"
      assert customer.email == "some email"
      assert customer.shipping_state == "some shipping_state"
      assert customer.disable_billing_same_as_shipping == true
      assert customer.shipping_first_name == "some shipping_first_name"
      assert customer.billing_company == "some billing_company"
      assert customer.billing_first_name == "some billing_first_name"
      assert customer.non_taxable == true
      assert customer.additional_field_3 == "some additional_field_3"
      assert customer.total_store_credit == 120.5
      assert customer.additional_field_2 == "some additional_field_2"
      assert customer.billing_address_1 == "some billing_address_1"
      assert customer.shipping_company == "some shipping_company"
      assert customer.shipping_city == "some shipping_city"
      assert customer.shipping_address_2 == "some shipping_address_2"
      assert customer.billing_address_2 == "some billing_address_2"
      assert customer.shipping_phone_number == "some shipping_phone_number"
      assert customer.customer_id == 42
      assert customer.enabled == true
      assert customer.shipping_country == "some shipping_country"
      assert customer.billing_zip_code == "some billing_zip_code"
      assert customer.shipping_last_name == "some shipping_last_name"
      assert customer.reset_password == true
      assert customer.shipping_address_1 == "some shipping_address_1"
      assert customer.billing_city == "some billing_city"
      assert customer.shipping_zipcode == "some shipping_zipcode"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{shipping_zipcode: "some updated shipping_zipcode", billing_city: "some updated billing_city", shipping_address_1: "some updated shipping_address_1", reset_password: false, shipping_last_name: "some updated shipping_last_name", billing_zip_code: "some updated billing_zip_code", shipping_country: "some updated shipping_country", enabled: false, customer_id: 43, shipping_phone_number: "some updated shipping_phone_number", billing_address_2: "some updated billing_address_2", shipping_address_2: "some updated shipping_address_2", shipping_city: "some updated shipping_city", shipping_company: "some updated shipping_company", billing_address_1: "some updated billing_address_1", additional_field_2: "some updated additional_field_2", total_store_credit: 456.7, additional_field_3: "some updated additional_field_3", non_taxable: false, billing_first_name: "some updated billing_first_name", billing_company: "some updated billing_company", shipping_first_name: "some updated shipping_first_name", disable_billing_same_as_shipping: false, shipping_state: "some updated shipping_state", email: "some updated email", billing_last_name: "some updated billing_last_name", shipping_address_type: 43, additional_field_1: "some updated additional_field_1", billing_phone_number: "some updated billing_phone_number", password: "some updated password", billing_taxid: "some updated billing_taxid", billing_state: "some updated billing_state", customer_group_id: 43, comments: "some updated comments", billing_country: "some updated billing_country", mail_list: false}

      assert {:ok, %Customer{} = customer} = Customers.update_customer(customer, update_attrs)
      assert customer.mail_list == false
      assert customer.billing_country == "some updated billing_country"
      assert customer.comments == "some updated comments"
      assert customer.customer_group_id == 43
      assert customer.billing_state == "some updated billing_state"
      assert customer.billing_taxid == "some updated billing_taxid"
      assert customer.password == "some updated password"
      assert customer.billing_phone_number == "some updated billing_phone_number"
      assert customer.additional_field_1 == "some updated additional_field_1"
      assert customer.shipping_address_type == 43
      assert customer.billing_last_name == "some updated billing_last_name"
      assert customer.email == "some updated email"
      assert customer.shipping_state == "some updated shipping_state"
      assert customer.disable_billing_same_as_shipping == false
      assert customer.shipping_first_name == "some updated shipping_first_name"
      assert customer.billing_company == "some updated billing_company"
      assert customer.billing_first_name == "some updated billing_first_name"
      assert customer.non_taxable == false
      assert customer.additional_field_3 == "some updated additional_field_3"
      assert customer.total_store_credit == 456.7
      assert customer.additional_field_2 == "some updated additional_field_2"
      assert customer.billing_address_1 == "some updated billing_address_1"
      assert customer.shipping_company == "some updated shipping_company"
      assert customer.shipping_city == "some updated shipping_city"
      assert customer.shipping_address_2 == "some updated shipping_address_2"
      assert customer.billing_address_2 == "some updated billing_address_2"
      assert customer.shipping_phone_number == "some updated shipping_phone_number"
      assert customer.customer_id == 43
      assert customer.enabled == false
      assert customer.shipping_country == "some updated shipping_country"
      assert customer.billing_zip_code == "some updated billing_zip_code"
      assert customer.shipping_last_name == "some updated shipping_last_name"
      assert customer.reset_password == false
      assert customer.shipping_address_1 == "some updated shipping_address_1"
      assert customer.billing_city == "some updated billing_city"
      assert customer.shipping_zipcode == "some updated shipping_zipcode"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_customer(customer, @invalid_attrs)
      assert customer == Customers.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Customers.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Customers.change_customer(customer)
    end
  end

  describe "customers" do
    alias Api.Customers.Customer

    import Api.CustomersFixtures

    @invalid_attrs %{shipping_zipcode: nil, billing_city: nil, shipping_address_1: nil, reset_password: nil, shipping_last_name: nil, billing_zip_code: nil, shipping_country: nil, enabled: nil, customer_id: nil, shipping_phone_number: nil, billing_address_2: nil, shipping_address_2: nil, shipping_city: nil, shipping_company: nil, billing_address_1: nil, additional_field_2: nil, total_store_credit: nil, additional_field_3: nil, non_taxable: nil, billing_first_name: nil, billing_company: nil, shipping_first_name: nil, disable_billing_same_as_shipping: nil, shipping_state: nil, email: nil, billing_last_name: nil, shipping_address_type: nil, additional_field_1: nil, billing_phone_number: nil, password: nil, billing_taxid: nil, billing_state: nil, customer_group_id: nil, comments: nil, billing_country: nil, mail_list: nil}

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Customers.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Customers.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{shipping_zipcode: "some shipping_zipcode", billing_city: "some billing_city", shipping_address_1: "some shipping_address_1", reset_password: true, shipping_last_name: "some shipping_last_name", billing_zip_code: "some billing_zip_code", shipping_country: "some shipping_country", enabled: true, customer_id: 42, shipping_phone_number: "some shipping_phone_number", billing_address_2: "some billing_address_2", shipping_address_2: "some shipping_address_2", shipping_city: "some shipping_city", shipping_company: "some shipping_company", billing_address_1: "some billing_address_1", additional_field_2: "some additional_field_2", total_store_credit: 120.5, additional_field_3: "some additional_field_3", non_taxable: true, billing_first_name: "some billing_first_name", billing_company: "some billing_company", shipping_first_name: "some shipping_first_name", disable_billing_same_as_shipping: true, shipping_state: "some shipping_state", email: "some email", billing_last_name: "some billing_last_name", shipping_address_type: 42, additional_field_1: "some additional_field_1", billing_phone_number: "some billing_phone_number", password: "some password", billing_taxid: "some billing_taxid", billing_state: "some billing_state", customer_group_id: 42, comments: "some comments", billing_country: "some billing_country", mail_list: true}

      assert {:ok, %Customer{} = customer} = Customers.create_customer(valid_attrs)
      assert customer.mail_list == true
      assert customer.billing_country == "some billing_country"
      assert customer.comments == "some comments"
      assert customer.customer_group_id == 42
      assert customer.billing_state == "some billing_state"
      assert customer.billing_taxid == "some billing_taxid"
      assert customer.password == "some password"
      assert customer.billing_phone_number == "some billing_phone_number"
      assert customer.additional_field_1 == "some additional_field_1"
      assert customer.shipping_address_type == 42
      assert customer.billing_last_name == "some billing_last_name"
      assert customer.email == "some email"
      assert customer.shipping_state == "some shipping_state"
      assert customer.disable_billing_same_as_shipping == true
      assert customer.shipping_first_name == "some shipping_first_name"
      assert customer.billing_company == "some billing_company"
      assert customer.billing_first_name == "some billing_first_name"
      assert customer.non_taxable == true
      assert customer.additional_field_3 == "some additional_field_3"
      assert customer.total_store_credit == 120.5
      assert customer.additional_field_2 == "some additional_field_2"
      assert customer.billing_address_1 == "some billing_address_1"
      assert customer.shipping_company == "some shipping_company"
      assert customer.shipping_city == "some shipping_city"
      assert customer.shipping_address_2 == "some shipping_address_2"
      assert customer.billing_address_2 == "some billing_address_2"
      assert customer.shipping_phone_number == "some shipping_phone_number"
      assert customer.customer_id == 42
      assert customer.enabled == true
      assert customer.shipping_country == "some shipping_country"
      assert customer.billing_zip_code == "some billing_zip_code"
      assert customer.shipping_last_name == "some shipping_last_name"
      assert customer.reset_password == true
      assert customer.shipping_address_1 == "some shipping_address_1"
      assert customer.billing_city == "some billing_city"
      assert customer.shipping_zipcode == "some shipping_zipcode"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{shipping_zipcode: "some updated shipping_zipcode", billing_city: "some updated billing_city", shipping_address_1: "some updated shipping_address_1", reset_password: false, shipping_last_name: "some updated shipping_last_name", billing_zip_code: "some updated billing_zip_code", shipping_country: "some updated shipping_country", enabled: false, customer_id: 43, shipping_phone_number: "some updated shipping_phone_number", billing_address_2: "some updated billing_address_2", shipping_address_2: "some updated shipping_address_2", shipping_city: "some updated shipping_city", shipping_company: "some updated shipping_company", billing_address_1: "some updated billing_address_1", additional_field_2: "some updated additional_field_2", total_store_credit: 456.7, additional_field_3: "some updated additional_field_3", non_taxable: false, billing_first_name: "some updated billing_first_name", billing_company: "some updated billing_company", shipping_first_name: "some updated shipping_first_name", disable_billing_same_as_shipping: false, shipping_state: "some updated shipping_state", email: "some updated email", billing_last_name: "some updated billing_last_name", shipping_address_type: 43, additional_field_1: "some updated additional_field_1", billing_phone_number: "some updated billing_phone_number", password: "some updated password", billing_taxid: "some updated billing_taxid", billing_state: "some updated billing_state", customer_group_id: 43, comments: "some updated comments", billing_country: "some updated billing_country", mail_list: false}

      assert {:ok, %Customer{} = customer} = Customers.update_customer(customer, update_attrs)
      assert customer.mail_list == false
      assert customer.billing_country == "some updated billing_country"
      assert customer.comments == "some updated comments"
      assert customer.customer_group_id == 43
      assert customer.billing_state == "some updated billing_state"
      assert customer.billing_taxid == "some updated billing_taxid"
      assert customer.password == "some updated password"
      assert customer.billing_phone_number == "some updated billing_phone_number"
      assert customer.additional_field_1 == "some updated additional_field_1"
      assert customer.shipping_address_type == 43
      assert customer.billing_last_name == "some updated billing_last_name"
      assert customer.email == "some updated email"
      assert customer.shipping_state == "some updated shipping_state"
      assert customer.disable_billing_same_as_shipping == false
      assert customer.shipping_first_name == "some updated shipping_first_name"
      assert customer.billing_company == "some updated billing_company"
      assert customer.billing_first_name == "some updated billing_first_name"
      assert customer.non_taxable == false
      assert customer.additional_field_3 == "some updated additional_field_3"
      assert customer.total_store_credit == 456.7
      assert customer.additional_field_2 == "some updated additional_field_2"
      assert customer.billing_address_1 == "some updated billing_address_1"
      assert customer.shipping_company == "some updated shipping_company"
      assert customer.shipping_city == "some updated shipping_city"
      assert customer.shipping_address_2 == "some updated shipping_address_2"
      assert customer.billing_address_2 == "some updated billing_address_2"
      assert customer.shipping_phone_number == "some updated shipping_phone_number"
      assert customer.customer_id == 43
      assert customer.enabled == false
      assert customer.shipping_country == "some updated shipping_country"
      assert customer.billing_zip_code == "some updated billing_zip_code"
      assert customer.shipping_last_name == "some updated shipping_last_name"
      assert customer.reset_password == false
      assert customer.shipping_address_1 == "some updated shipping_address_1"
      assert customer.billing_city == "some updated billing_city"
      assert customer.shipping_zipcode == "some updated shipping_zipcode"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_customer(customer, @invalid_attrs)
      assert customer == Customers.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Customers.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Customers.change_customer(customer)
    end
  end
end
