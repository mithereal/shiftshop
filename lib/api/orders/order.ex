defmodule Api.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :order_item_list, :string
    field :transaction_list, :float
    field :question_list, :string
    field :order_status_id, :string
    field :card_type, :string
    field :billing_state, :string
    field :customer_comments, :string
    field :continue_url, :string
    field :invoice_number, :integer
    field :card_address, :string
    field :order_date, :string
    field :billing_last_name, :string
    field :billing_payment_method_id, :string
    field :billing_on_line_payment, :string
    field :payment_token_id, :string
    field :affiliate_commission, :float
    field :billing_email, :string
    field :alternate_order_id, :string
    field :billing_phone_number, :string
    field :card_name, :string
    field :ip, :string
    field :billing_company, :string
    field :sales_person, :string
    field :invoice_number_prefix, :string
    field :last_update, :string
    field :card_start_month, :string
    field :sales_tax_3, :float
    field :card_number, :string
    field :billing_payment_method, :string
    field :card_expiration_year, :string
    field :customer_id, :integer
    field :billing_zip_code, :string
    field :external_comments, :string
    field :order_amount, :float
    field :promotion_list, :string
    field :billing_country, :string
    field :card_verification, :string
    field :order_type, :string
    field :shipment_list, :string
    field :order_discount_promotion, :float
    field :order_id, :integer
    field :billing_first_name, :string
    field :billing_address_2, :string
    field :user_id, :string
    field :sales_tax, :float
    field :reward_points, :string
    field :order_discount, :float
    field :referer, :string
    field :billing_city, :string
    field :card_start_year, :string
    field :billing_address, :string
    field :order_discount_coupon, :float
    field :internal_comments, :string
    field :card_expiration_month, :string
    field :sales_tax_2, :float
    field :card_issue_number, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:invoice_number_prefix, :invoice_number, :order_id, :customer_id, :order_date, :order_status_id, :last_update, :user_id, :sales_person, :continue_url, :alternate_order_id, :order_type, :payment_token_id, :billing_first_name, :billing_last_name, :billing_company, :billing_address, :billing_address_2, :billing_city, :billing_state, :billing_zip_code, :billing_country, :billing_phone_number, :billing_email, :billing_payment_method, :billing_on_line_payment, :billing_payment_method_id, :shipment_list, :order_item_list, :promotion_list, :order_discount, :order_discount_coupon, :order_discount_promotion, :sales_tax, :sales_tax_2, :sales_tax_3, :order_amount, :affiliate_commission, :transaction_list, :card_type, :card_number, :card_name, :card_expiration_month, :card_expiration_year, :card_issue_number, :card_start_month, :card_start_year, :card_address, :card_verification, :reward_points, :question_list, :referer, :ip, :customer_comments, :internal_comments, :external_comments])
    |> validate_required([:invoice_number_prefix, :invoice_number, :order_id, :customer_id, :order_date, :order_status_id, :last_update, :user_id, :sales_person, :continue_url, :alternate_order_id, :order_type, :payment_token_id, :billing_first_name, :billing_last_name, :billing_company, :billing_address, :billing_address_2, :billing_city, :billing_state, :billing_zip_code, :billing_country, :billing_phone_number, :billing_email, :billing_payment_method, :billing_on_line_payment, :billing_payment_method_id, :shipment_list, :order_item_list, :promotion_list, :order_discount, :order_discount_coupon, :order_discount_promotion, :sales_tax, :sales_tax_2, :sales_tax_3, :order_amount, :affiliate_commission, :transaction_list, :card_type, :card_number, :card_name, :card_expiration_month, :card_expiration_year, :card_issue_number, :card_start_month, :card_start_year, :card_address, :card_verification, :reward_points, :question_list, :referer, :ip, :customer_comments, :internal_comments, :external_comments])
  end
end
