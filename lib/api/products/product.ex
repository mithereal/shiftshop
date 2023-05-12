defmodule Api.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :thumbnail_file, :string
    field :buy_button_link, :string
    field :minimum_acceptable_offer, :string
    field :reorder_quantity, :integer
    field :extra_field_2, :string
    field :feature_list, :string
    field :additional_image_caption_4, :string
    field :description, :string
    field :distributor_list, :string
    field :login_required_option_redirect_to, :string
    field :re_use_keys, :string
    field :extra_field_3, :string
    field :ship_cost, :float
    field :price_level_7, :float
    field :enable_make_an_offer_feature, :string
    field :login_required_option_id, :integer
    field :width, :float
    field :sample_enable, :string
    field :category_list, :string
    field :mfgid, :string
    field :extra_field_11, :string
    field :manufacturer_name, :string
    field :gift_certificate, :string
    field :disable_rewards, :integer
    field :allow_access_customer_group_name, :string
    field :additional_image_file_2, :string
    field :eproduct_list, :string
    field :allow_access_customer_group_id, :integer
    field :price_level_6_hide, :float
    field :price_level_2, :float
    field :price_level_5, :float
    field :redeem_points, :integer
    field :custom_file_name, :string
    field :title, :string
    field :apply_quantity_discount_to_options, :string
    field :do_not_use_category_options, :string
    field :non_taxable, :string
    field :extra_field_1, :string
    field :free_shipping, :float
    field :additional_image_caption_3, :string
    field :depth, :float
    field :related_product_list, :string
    field :external_ids_list, :string
    field :allow_only_multiples, :float
    field :special_instructions, :string
    field :main_image_caption, :string
    field :redirect_link, :string
    field :review_average, :float
    field :self_ship, :float
    field :extra_field_5, :string
    field :price_level_1_hide, :float
    field :serial_list, :string
    field :meta_tags, :string
    field :price_level_6, :float
    field :canonical_url, :string
    field :home_special, :string
    field :gtin, :string
    field :skuinfo, :integer
    field :last_update, :string
    field :up_selling_item_list, :string
    field :extra_field_9, :string
    field :discount_list, :string
    field :price_level_1, :float
    field :warehouse_aisle, :string
    field :price_level_3, :float
    field :extra_field_4, :string
    field :price_level_3_hide, :float
    field :reward_points, :integer
    field :price_level_7_hide, :float
    field :price_level_10_hide, :float
    field :price_level_2_hide, :float
    field :extra_field_7, :string
    field :manufacturer_id, :integer
    field :weight, :float
    field :sample_skuprefix, :string
    field :date_created, :string
    field :price_level_10, :float
    field :price_level_4_hide, :float
    field :image_gallery_list, :string
    field :additional_image_file_4, :string
    field :warehouse_custom, :string
    field :price_level_8, :float
    field :review_count, :integer
    field :rmamax_period, :string
    field :price_level_9_hide, :float
    field :in_stock_message, :string
    field :height, :float
    field :maximum_quantity, :float
    field :minimum_quantity, :float
    field :additional_image_file_3, :string
    field :sample_weight, :float
    field :extra_field_12, :string
    field :additional_image_caption_2, :string
    field :category_external_ids_list, :string
    field :listing_template_id, :integer
    field :group_options_for_quantity_pricing, :string
    field :advanced_option_list, :string
    field :stock_alert, :integer
    field :inventory_control, :string
    field :main_image_file, :string
    field :short_description, :string
    field :not_for_sale, :string
    field :non_searchable, :string
    field :product_link, :string
    field :media_file, :string
    field :user_id, :string
    field :assign_key, :string
    field :price_level_8_hide, :float
    field :price_level_5_hide, :float
    field :quantity_options, :string
    field :login_required_option_name, :string
    field :tax_code, :string
    field :option_set_list, :string
    field :warehouse_location, :string
    field :extra_field_13, :string
    field :out_of_stock_message, :string
    field :plugin_list, :string
    field :gift_wrap_item, :string
    field :extra_field_10, :string
    field :price_level_4, :float
    field :display_text, :string
    field :price_level_9, :float
    field :hide, :string
    field :keywords, :string
    field :listing_template_name, :string
    field :allow_fractional_quantity, :float
    field :sample_price, :float
    field :category_special, :string
    field :back_order_message, :string
    field :sample_name, :string
    field :extra_field_6, :string
    field :warehouse_bin, :string
    field :extra_field_8, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [
      :skuinfo,
      :mfgid,
      :short_description,
      :manufacturer_id,
      :manufacturer_name,
      :distributor_list,
      :last_update,
      :user_id,
      :gtin,
      :category_list,
      :external_ids_list,
      :category_external_ids_list,
      :non_taxable,
      :not_for_sale,
      :hide,
      :gift_certificate,
      :home_special,
      :category_special,
      :non_searchable,
      :gift_wrap_item,
      :ship_cost,
      :weight,
      :height,
      :width,
      :depth,
      :self_ship,
      :free_shipping,
      :reward_points,
      :redeem_points,
      :disable_rewards,
      :stock_alert,
      :reorder_quantity,
      :in_stock_message,
      :out_of_stock_message,
      :back_order_message,
      :inventory_control,
      :warehouse_location,
      :warehouse_bin,
      :warehouse_aisle,
      :warehouse_custom,
      :description,
      :keywords,
      :extra_field_1,
      :extra_field_2,
      :extra_field_3,
      :extra_field_4,
      :extra_field_5,
      :extra_field_6,
      :extra_field_7,
      :extra_field_8,
      :extra_field_9,
      :extra_field_10,
      :extra_field_11,
      :extra_field_12,
      :extra_field_13,
      :feature_list,
      :plugin_list,
      :sample_enable,
      :sample_name,
      :sample_skuprefix,
      :sample_price,
      :sample_weight,
      :review_average,
      :review_count,
      :main_image_file,
      :main_image_caption,
      :thumbnail_file,
      :media_file,
      :additional_image_file_2,
      :additional_image_caption_2,
      :additional_image_file_3,
      :additional_image_caption_3,
      :additional_image_file_4,
      :additional_image_caption_4,
      :image_gallery_list,
      :option_set_list,
      :advanced_option_list,
      :related_product_list,
      :up_selling_item_list,
      :discount_list,
      :do_not_use_category_options,
      :date_created,
      :listing_template_id,
      :listing_template_name,
      :login_required_option_id,
      :login_required_option_name,
      :login_required_option_redirect_to,
      :allow_access_customer_group_id,
      :allow_access_customer_group_name,
      :rmamax_period,
      :canonical_url,
      :tax_code,
      :display_text,
      :minimum_quantity,
      :maximum_quantity,
      :allow_only_multiples,
      :allow_fractional_quantity,
      :quantity_options,
      :group_options_for_quantity_pricing,
      :apply_quantity_discount_to_options,
      :enable_make_an_offer_feature,
      :minimum_acceptable_offer,
      :price_level_1,
      :price_level_1_hide,
      :price_level_2,
      :price_level_2_hide,
      :price_level_3,
      :price_level_3_hide,
      :price_level_4,
      :price_level_4_hide,
      :price_level_5,
      :price_level_5_hide,
      :price_level_6,
      :price_level_6_hide,
      :price_level_7,
      :price_level_7_hide,
      :price_level_8,
      :price_level_8_hide,
      :price_level_9,
      :price_level_9_hide,
      :price_level_10,
      :price_level_10_hide,
      :buy_button_link,
      :product_link,
      :title,
      :custom_file_name,
      :redirect_link,
      :meta_tags,
      :special_instructions,
      :assign_key,
      :re_use_keys,
      :serial_list,
      :eproduct_list
    ])
    |> validate_required([
      :skuinfo,
      :mfgid,
      :short_description,
      :manufacturer_id,
      :manufacturer_name,
      :distributor_list,
      :last_update,
      :user_id,
      :gtin,
      :category_list,
      :external_ids_list,
      :category_external_ids_list,
      :non_taxable,
      :not_for_sale,
      :hide,
      :gift_certificate,
      :home_special,
      :category_special,
      :non_searchable,
      :gift_wrap_item,
      :ship_cost,
      :weight,
      :height,
      :width,
      :depth,
      :self_ship,
      :free_shipping,
      :reward_points,
      :redeem_points,
      :disable_rewards,
      :stock_alert,
      :reorder_quantity,
      :in_stock_message,
      :out_of_stock_message,
      :back_order_message,
      :inventory_control,
      :warehouse_location,
      :warehouse_bin,
      :warehouse_aisle,
      :warehouse_custom,
      :description,
      :keywords,
      :extra_field_1,
      :extra_field_2,
      :extra_field_3,
      :extra_field_4,
      :extra_field_5,
      :extra_field_6,
      :extra_field_7,
      :extra_field_8,
      :extra_field_9,
      :extra_field_10,
      :extra_field_11,
      :extra_field_12,
      :extra_field_13,
      :feature_list,
      :plugin_list,
      :sample_enable,
      :sample_name,
      :sample_skuprefix,
      :sample_price,
      :sample_weight,
      :review_average,
      :review_count,
      :main_image_file,
      :main_image_caption,
      :thumbnail_file,
      :media_file,
      :additional_image_file_2,
      :additional_image_caption_2,
      :additional_image_file_3,
      :additional_image_caption_3,
      :additional_image_file_4,
      :additional_image_caption_4,
      :image_gallery_list,
      :option_set_list,
      :advanced_option_list,
      :related_product_list,
      :up_selling_item_list,
      :discount_list,
      :do_not_use_category_options,
      :date_created,
      :listing_template_id,
      :listing_template_name,
      :login_required_option_id,
      :login_required_option_name,
      :login_required_option_redirect_to,
      :allow_access_customer_group_id,
      :allow_access_customer_group_name,
      :rmamax_period,
      :canonical_url,
      :tax_code,
      :display_text,
      :minimum_quantity,
      :maximum_quantity,
      :allow_only_multiples,
      :allow_fractional_quantity,
      :quantity_options,
      :group_options_for_quantity_pricing,
      :apply_quantity_discount_to_options,
      :enable_make_an_offer_feature,
      :minimum_acceptable_offer,
      :price_level_1,
      :price_level_1_hide,
      :price_level_2,
      :price_level_2_hide,
      :price_level_3,
      :price_level_3_hide,
      :price_level_4,
      :price_level_4_hide,
      :price_level_5,
      :price_level_5_hide,
      :price_level_6,
      :price_level_6_hide,
      :price_level_7,
      :price_level_7_hide,
      :price_level_8,
      :price_level_8_hide,
      :price_level_9,
      :price_level_9_hide,
      :price_level_10,
      :price_level_10_hide,
      :buy_button_link,
      :product_link,
      :title,
      :custom_file_name,
      :redirect_link,
      :meta_tags,
      :special_instructions,
      :assign_key,
      :re_use_keys,
      :serial_list,
      :eproduct_list
    ])
  end
end
