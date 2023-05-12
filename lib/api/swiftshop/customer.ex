defmodule Api.Swiftshop.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customer" do
    field :disable_billing_same_as_shipping, :boolean, default: false
    field :billing_address_1, :string
    field :comments, :string
    field :shipping_city, :string
    field :billing_state, :string
    field :email, :string
    field :billing_last_name, :string
    field :shipping_company, :string
    field :mail_list, :boolean, default: false
    field :customer_group_id, :integer
    field :billing_phone_number, :string
    field :shipping_phone_number, :string
    field :billing_zip_code, :string
    field :password, :string
    field :shipping_country, :string
    field :shipping_first_name, :string
    field :billing_city, :string
    field :customer_id, :integer
    field :shipping_address_type, :integer
    field :billing_first_name, :string
    field :shipping_state, :string
    field :additional_field_1, :string
    field :shipping_zipcode, :string
    field :billing_country, :string
    field :non_taxable, :boolean, default: false
    field :total_store_credit, :float
    field :billing_company, :string
    field :billing_taxid, :string
    field :enabled, :boolean, default: false
    field :shipping_address_1, :string
    field :billing_address_2, :string
    field :reset_password, :boolean, default: false
    field :additional_field_2, :string
    field :shipping_address_2, :string
    field :shipping_last_name, :string
    field :additional_field_3, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [
      :customer_id,
      :email,
      :password,
      :billing_company,
      :billing_first_name,
      :billing_last_name,
      :billing_address_1,
      :billing_address_2,
      :billing_city,
      :billing_state,
      :billing_zip_code,
      :billing_country,
      :billing_phone_number,
      :billing_taxid,
      :shipping_company,
      :shipping_first_name,
      :shipping_last_name,
      :shipping_address_1,
      :shipping_address_2,
      :shipping_city,
      :shipping_state,
      :shipping_zipcode,
      :shipping_country,
      :shipping_phone_number,
      :shipping_address_type,
      :customer_group_id,
      :enabled,
      :mail_list,
      :non_taxable,
      :disable_billing_same_as_shipping,
      :comments,
      :additional_field_1,
      :additional_field_2,
      :additional_field_3,
      :total_store_credit,
      :reset_password
    ])
    |> validate_required([
      :customer_id,
      :email,
      :password,
      :billing_company,
      :billing_first_name,
      :billing_last_name,
      :billing_address_1,
      :billing_address_2,
      :billing_city,
      :billing_state,
      :billing_zip_code,
      :billing_country,
      :billing_phone_number,
      :billing_taxid,
      :shipping_company,
      :shipping_first_name,
      :shipping_last_name,
      :shipping_address_1,
      :shipping_address_2,
      :shipping_city,
      :shipping_state,
      :shipping_zipcode,
      :shipping_country,
      :shipping_phone_number,
      :shipping_address_type,
      :customer_group_id,
      :enabled,
      :mail_list,
      :non_taxable,
      :disable_billing_same_as_shipping,
      :comments,
      :additional_field_1,
      :additional_field_2,
      :additional_field_3,
      :total_store_credit,
      :reset_password
    ])
  end
end
