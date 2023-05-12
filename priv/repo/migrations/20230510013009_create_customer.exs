defmodule Api.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customer) do
      add :customer_id, :integer
      add :email, :string
      add :password, :string
      add :billing_company, :string
      add :billing_first_name, :string
      add :billing_last_name, :string
      add :billing_address_1, :string
      add :billing_address_2, :string
      add :billing_city, :string
      add :billing_state, :string
      add :billing_zip_code, :string
      add :billing_country, :string
      add :billing_phone_number, :string
      add :billing_taxid, :string
      add :shipping_company, :string
      add :shipping_first_name, :string
      add :shipping_last_name, :string
      add :shipping_address_1, :string
      add :shipping_address_2, :string
      add :shipping_city, :string
      add :shipping_state, :string
      add :shipping_zipcode, :string
      add :shipping_country, :string
      add :shipping_phone_number, :string
      add :shipping_address_type, :integer
      add :customer_group_id, :integer
      add :enabled, :boolean, default: false, null: false
      add :mail_list, :boolean, default: false, null: false
      add :non_taxable, :boolean, default: false, null: false
      add :disable_billing_same_as_shipping, :boolean, default: false, null: false
      add :comments, :string
      add :additional_field_1, :string
      add :additional_field_2, :string
      add :additional_field_3, :string
      add :total_store_credit, :float
      add :reset_password, :boolean, default: false, null: false

      timestamps()
    end
  end
end
