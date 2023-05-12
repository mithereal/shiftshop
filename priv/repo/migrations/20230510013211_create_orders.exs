defmodule Api.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :invoice_number_prefix, :string
      add :invoice_number, :integer
      add :order_id, :integer
      add :customer_id, :integer
      add :order_date, :string
      add :order_status_id, :string
      add :last_update, :string
      add :user_id, :string
      add :sales_person, :string
      add :continue_url, :string
      add :alternate_order_id, :string
      add :order_type, :string
      add :payment_token_id, :string
      add :billing_first_name, :string
      add :billing_last_name, :string
      add :billing_company, :string
      add :billing_address, :string
      add :billing_address_2, :string
      add :billing_city, :string
      add :billing_state, :string
      add :billing_zip_code, :string
      add :billing_country, :string
      add :billing_phone_number, :string
      add :billing_email, :string
      add :billing_payment_method, :string
      add :billing_on_line_payment, :string
      add :billing_payment_method_id, :string
      add :shipment_list, :string
      add :order_item_list, :string
      add :promotion_list, :string
      add :order_discount, :float
      add :order_discount_coupon, :float
      add :order_discount_promotion, :float
      add :sales_tax, :float
      add :sales_tax_2, :float
      add :sales_tax_3, :float
      add :order_amount, :float
      add :affiliate_commission, :float
      add :transaction_list, :float
      add :card_type, :string
      add :card_number, :string
      add :card_name, :string
      add :card_expiration_month, :string
      add :card_expiration_year, :string
      add :card_issue_number, :string
      add :card_start_month, :string
      add :card_start_year, :string
      add :card_address, :string
      add :card_verification, :string
      add :reward_points, :string
      add :question_list, :string
      add :referer, :string
      add :ip, :string
      add :customer_comments, :string
      add :internal_comments, :string
      add :external_comments, :string

      timestamps()
    end
  end
end
