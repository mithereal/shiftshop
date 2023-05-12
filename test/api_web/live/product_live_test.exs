defmodule ApiWeb.ProductLiveTest do
  use ApiWeb.ConnCase

  import Phoenix.LiveViewTest
  import Api.ProductsFixtures

  @create_attrs %{
    extra_field_8: "some extra_field_8",
    warehouse_bin: "some warehouse_bin",
    extra_field_6: "some extra_field_6",
    sample_name: "some sample_name",
    back_order_message: "some back_order_message",
    category_special: "some category_special",
    sample_price: 120.5,
    allow_fractional_quantity: 120.5,
    listing_template_name: "some listing_template_name",
    keywords: "some keywords",
    hide: "some hide",
    price_level_9: 120.5,
    display_text: "some display_text",
    price_level_4: 120.5,
    extra_field_10: "some extra_field_10",
    gift_wrap_item: "some gift_wrap_item",
    plugin_list: "some plugin_list",
    out_of_stock_message: "some out_of_stock_message",
    extra_field_13: "some extra_field_13",
    warehouse_location: "some warehouse_location",
    option_set_list: "some option_set_list",
    tax_code: "some tax_code",
    login_required_option_name: "some login_required_option_name",
    quantity_options: "some quantity_options",
    price_level_5_hide: 120.5,
    price_level_8_hide: 120.5,
    assign_key: "some assign_key",
    user_id: "some user_id",
    media_file: "some media_file",
    product_link: "some product_link",
    non_searchable: "some non_searchable",
    not_for_sale: "some not_for_sale",
    short_description: "some short_description",
    main_image_file: "some main_image_file",
    inventory_control: "some inventory_control",
    stock_alert: 42,
    advanced_option_list: "some advanced_option_list",
    group_options_for_quantity_pricing: "some group_options_for_quantity_pricing",
    listing_template_id: 42,
    category_external_ids_list: "some category_external_ids_list",
    additional_image_caption_2: "some additional_image_caption_2",
    extra_field_12: "some extra_field_12",
    sample_weight: 120.5,
    additional_image_file_3: "some additional_image_file_3",
    minimum_quantity: 120.5,
    maximum_quantity: 120.5,
    height: 120.5,
    in_stock_message: "some in_stock_message",
    price_level_9_hide: 120.5,
    rmamax_period: "some rmamax_period",
    review_count: 42,
    price_level_8: 120.5,
    warehouse_custom: "some warehouse_custom",
    additional_image_file_4: "some additional_image_file_4",
    image_gallery_list: "some image_gallery_list",
    price_level_4_hide: 120.5,
    price_level_10: 120.5,
    date_created: "some date_created",
    sample_skuprefix: "some sample_skuprefix",
    weight: 120.5,
    manufacturer_id: 42,
    extra_field_7: "some extra_field_7",
    price_level_2_hide: 120.5,
    price_level_10_hide: 120.5,
    price_level_7_hide: 120.5,
    reward_points: 42,
    price_level_3_hide: 120.5,
    extra_field_4: "some extra_field_4",
    price_level_3: 120.5,
    warehouse_aisle: "some warehouse_aisle",
    price_level_1: 120.5,
    discount_list: "some discount_list",
    extra_field_9: "some extra_field_9",
    up_selling_item_list: "some up_selling_item_list",
    last_update: "some last_update",
    skuinfo: 42,
    gtin: "some gtin",
    home_special: "some home_special",
    canonical_url: "some canonical_url",
    price_level_6: 120.5,
    meta_tags: "some meta_tags",
    serial_list: "some serial_list",
    price_level_1_hide: 120.5,
    extra_field_5: "some extra_field_5",
    self_ship: 120.5,
    review_average: 120.5,
    redirect_link: "some redirect_link",
    main_image_caption: "some main_image_caption",
    special_instructions: "some special_instructions",
    allow_only_multiples: 120.5,
    external_ids_list: "some external_ids_list",
    related_product_list: "some related_product_list",
    depth: 120.5,
    additional_image_caption_3: "some additional_image_caption_3",
    free_shipping: 120.5,
    extra_field_1: "some extra_field_1",
    non_taxable: "some non_taxable",
    do_not_use_category_options: "some do_not_use_category_options",
    apply_quantity_discount_to_options: "some apply_quantity_discount_to_options",
    title: "some title",
    custom_file_name: "some custom_file_name",
    redeem_points: 42,
    price_level_5: 120.5,
    price_level_2: 120.5,
    price_level_6_hide: 120.5,
    allow_access_customer_group_id: 42,
    eproduct_list: "some eproduct_list",
    additional_image_file_2: "some additional_image_file_2",
    allow_access_customer_group_name: "some allow_access_customer_group_name",
    disable_rewards: 42,
    gift_certificate: "some gift_certificate",
    manufacturer_name: "some manufacturer_name",
    extra_field_11: "some extra_field_11",
    mfgid: "some mfgid",
    category_list: "some category_list",
    sample_enable: "some sample_enable",
    width: 120.5,
    login_required_option_id: 42,
    enable_make_an_offer_feature: "some enable_make_an_offer_feature",
    price_level_7: 120.5,
    ship_cost: 120.5,
    extra_field_3: "some extra_field_3",
    re_use_keys: "some re_use_keys",
    login_required_option_redirect_to: "some login_required_option_redirect_to",
    distributor_list: "some distributor_list",
    description: "some description",
    additional_image_caption_4: "some additional_image_caption_4",
    feature_list: "some feature_list",
    extra_field_2: "some extra_field_2",
    reorder_quantity: 42,
    minimum_acceptable_offer: "some minimum_acceptable_offer",
    buy_button_link: "some buy_button_link",
    thumbnail_file: "some thumbnail_file"
  }
  @update_attrs %{
    extra_field_8: "some updated extra_field_8",
    warehouse_bin: "some updated warehouse_bin",
    extra_field_6: "some updated extra_field_6",
    sample_name: "some updated sample_name",
    back_order_message: "some updated back_order_message",
    category_special: "some updated category_special",
    sample_price: 456.7,
    allow_fractional_quantity: 456.7,
    listing_template_name: "some updated listing_template_name",
    keywords: "some updated keywords",
    hide: "some updated hide",
    price_level_9: 456.7,
    display_text: "some updated display_text",
    price_level_4: 456.7,
    extra_field_10: "some updated extra_field_10",
    gift_wrap_item: "some updated gift_wrap_item",
    plugin_list: "some updated plugin_list",
    out_of_stock_message: "some updated out_of_stock_message",
    extra_field_13: "some updated extra_field_13",
    warehouse_location: "some updated warehouse_location",
    option_set_list: "some updated option_set_list",
    tax_code: "some updated tax_code",
    login_required_option_name: "some updated login_required_option_name",
    quantity_options: "some updated quantity_options",
    price_level_5_hide: 456.7,
    price_level_8_hide: 456.7,
    assign_key: "some updated assign_key",
    user_id: "some updated user_id",
    media_file: "some updated media_file",
    product_link: "some updated product_link",
    non_searchable: "some updated non_searchable",
    not_for_sale: "some updated not_for_sale",
    short_description: "some updated short_description",
    main_image_file: "some updated main_image_file",
    inventory_control: "some updated inventory_control",
    stock_alert: 43,
    advanced_option_list: "some updated advanced_option_list",
    group_options_for_quantity_pricing: "some updated group_options_for_quantity_pricing",
    listing_template_id: 43,
    category_external_ids_list: "some updated category_external_ids_list",
    additional_image_caption_2: "some updated additional_image_caption_2",
    extra_field_12: "some updated extra_field_12",
    sample_weight: 456.7,
    additional_image_file_3: "some updated additional_image_file_3",
    minimum_quantity: 456.7,
    maximum_quantity: 456.7,
    height: 456.7,
    in_stock_message: "some updated in_stock_message",
    price_level_9_hide: 456.7,
    rmamax_period: "some updated rmamax_period",
    review_count: 43,
    price_level_8: 456.7,
    warehouse_custom: "some updated warehouse_custom",
    additional_image_file_4: "some updated additional_image_file_4",
    image_gallery_list: "some updated image_gallery_list",
    price_level_4_hide: 456.7,
    price_level_10: 456.7,
    date_created: "some updated date_created",
    sample_skuprefix: "some updated sample_skuprefix",
    weight: 456.7,
    manufacturer_id: 43,
    extra_field_7: "some updated extra_field_7",
    price_level_2_hide: 456.7,
    price_level_10_hide: 456.7,
    price_level_7_hide: 456.7,
    reward_points: 43,
    price_level_3_hide: 456.7,
    extra_field_4: "some updated extra_field_4",
    price_level_3: 456.7,
    warehouse_aisle: "some updated warehouse_aisle",
    price_level_1: 456.7,
    discount_list: "some updated discount_list",
    extra_field_9: "some updated extra_field_9",
    up_selling_item_list: "some updated up_selling_item_list",
    last_update: "some updated last_update",
    skuinfo: 43,
    gtin: "some updated gtin",
    home_special: "some updated home_special",
    canonical_url: "some updated canonical_url",
    price_level_6: 456.7,
    meta_tags: "some updated meta_tags",
    serial_list: "some updated serial_list",
    price_level_1_hide: 456.7,
    extra_field_5: "some updated extra_field_5",
    self_ship: 456.7,
    review_average: 456.7,
    redirect_link: "some updated redirect_link",
    main_image_caption: "some updated main_image_caption",
    special_instructions: "some updated special_instructions",
    allow_only_multiples: 456.7,
    external_ids_list: "some updated external_ids_list",
    related_product_list: "some updated related_product_list",
    depth: 456.7,
    additional_image_caption_3: "some updated additional_image_caption_3",
    free_shipping: 456.7,
    extra_field_1: "some updated extra_field_1",
    non_taxable: "some updated non_taxable",
    do_not_use_category_options: "some updated do_not_use_category_options",
    apply_quantity_discount_to_options: "some updated apply_quantity_discount_to_options",
    title: "some updated title",
    custom_file_name: "some updated custom_file_name",
    redeem_points: 43,
    price_level_5: 456.7,
    price_level_2: 456.7,
    price_level_6_hide: 456.7,
    allow_access_customer_group_id: 43,
    eproduct_list: "some updated eproduct_list",
    additional_image_file_2: "some updated additional_image_file_2",
    allow_access_customer_group_name: "some updated allow_access_customer_group_name",
    disable_rewards: 43,
    gift_certificate: "some updated gift_certificate",
    manufacturer_name: "some updated manufacturer_name",
    extra_field_11: "some updated extra_field_11",
    mfgid: "some updated mfgid",
    category_list: "some updated category_list",
    sample_enable: "some updated sample_enable",
    width: 456.7,
    login_required_option_id: 43,
    enable_make_an_offer_feature: "some updated enable_make_an_offer_feature",
    price_level_7: 456.7,
    ship_cost: 456.7,
    extra_field_3: "some updated extra_field_3",
    re_use_keys: "some updated re_use_keys",
    login_required_option_redirect_to: "some updated login_required_option_redirect_to",
    distributor_list: "some updated distributor_list",
    description: "some updated description",
    additional_image_caption_4: "some updated additional_image_caption_4",
    feature_list: "some updated feature_list",
    extra_field_2: "some updated extra_field_2",
    reorder_quantity: 43,
    minimum_acceptable_offer: "some updated minimum_acceptable_offer",
    buy_button_link: "some updated buy_button_link",
    thumbnail_file: "some updated thumbnail_file"
  }
  @invalid_attrs %{
    extra_field_8: nil,
    warehouse_bin: nil,
    extra_field_6: nil,
    sample_name: nil,
    back_order_message: nil,
    category_special: nil,
    sample_price: nil,
    allow_fractional_quantity: nil,
    listing_template_name: nil,
    keywords: nil,
    hide: nil,
    price_level_9: nil,
    display_text: nil,
    price_level_4: nil,
    extra_field_10: nil,
    gift_wrap_item: nil,
    plugin_list: nil,
    out_of_stock_message: nil,
    extra_field_13: nil,
    warehouse_location: nil,
    option_set_list: nil,
    tax_code: nil,
    login_required_option_name: nil,
    quantity_options: nil,
    price_level_5_hide: nil,
    price_level_8_hide: nil,
    assign_key: nil,
    user_id: nil,
    media_file: nil,
    product_link: nil,
    non_searchable: nil,
    not_for_sale: nil,
    short_description: nil,
    main_image_file: nil,
    inventory_control: nil,
    stock_alert: nil,
    advanced_option_list: nil,
    group_options_for_quantity_pricing: nil,
    listing_template_id: nil,
    category_external_ids_list: nil,
    additional_image_caption_2: nil,
    extra_field_12: nil,
    sample_weight: nil,
    additional_image_file_3: nil,
    minimum_quantity: nil,
    maximum_quantity: nil,
    height: nil,
    in_stock_message: nil,
    price_level_9_hide: nil,
    rmamax_period: nil,
    review_count: nil,
    price_level_8: nil,
    warehouse_custom: nil,
    additional_image_file_4: nil,
    image_gallery_list: nil,
    price_level_4_hide: nil,
    price_level_10: nil,
    date_created: nil,
    sample_skuprefix: nil,
    weight: nil,
    manufacturer_id: nil,
    extra_field_7: nil,
    price_level_2_hide: nil,
    price_level_10_hide: nil,
    price_level_7_hide: nil,
    reward_points: nil,
    price_level_3_hide: nil,
    extra_field_4: nil,
    price_level_3: nil,
    warehouse_aisle: nil,
    price_level_1: nil,
    discount_list: nil,
    extra_field_9: nil,
    up_selling_item_list: nil,
    last_update: nil,
    skuinfo: nil,
    gtin: nil,
    home_special: nil,
    canonical_url: nil,
    price_level_6: nil,
    meta_tags: nil,
    serial_list: nil,
    price_level_1_hide: nil,
    extra_field_5: nil,
    self_ship: nil,
    review_average: nil,
    redirect_link: nil,
    main_image_caption: nil,
    special_instructions: nil,
    allow_only_multiples: nil,
    external_ids_list: nil,
    related_product_list: nil,
    depth: nil,
    additional_image_caption_3: nil,
    free_shipping: nil,
    extra_field_1: nil,
    non_taxable: nil,
    do_not_use_category_options: nil,
    apply_quantity_discount_to_options: nil,
    title: nil,
    custom_file_name: nil,
    redeem_points: nil,
    price_level_5: nil,
    price_level_2: nil,
    price_level_6_hide: nil,
    allow_access_customer_group_id: nil,
    eproduct_list: nil,
    additional_image_file_2: nil,
    allow_access_customer_group_name: nil,
    disable_rewards: nil,
    gift_certificate: nil,
    manufacturer_name: nil,
    extra_field_11: nil,
    mfgid: nil,
    category_list: nil,
    sample_enable: nil,
    width: nil,
    login_required_option_id: nil,
    enable_make_an_offer_feature: nil,
    price_level_7: nil,
    ship_cost: nil,
    extra_field_3: nil,
    re_use_keys: nil,
    login_required_option_redirect_to: nil,
    distributor_list: nil,
    description: nil,
    additional_image_caption_4: nil,
    feature_list: nil,
    extra_field_2: nil,
    reorder_quantity: nil,
    minimum_acceptable_offer: nil,
    buy_button_link: nil,
    thumbnail_file: nil
  }

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end

  describe "Index" do
    setup [:create_product]

    test "lists all products", %{conn: conn, product: product} do
      {:ok, _index_live, html} = live(conn, ~p"/products")

      assert html =~ "Listing Products"
      assert html =~ product.extra_field_8
    end

    test "saves new product", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/products")

      assert index_live |> element("a", "New Product") |> render_click() =~
               "New Product"

      assert_patch(index_live, ~p"/products/new")

      assert index_live
             |> form("#product-form", product: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#product-form", product: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/products")

      html = render(index_live)
      assert html =~ "Product created successfully"
      assert html =~ "some extra_field_8"
    end

    test "updates product in listing", %{conn: conn, product: product} do
      {:ok, index_live, _html} = live(conn, ~p"/products")

      assert index_live |> element("#products-#{product.id} a", "Edit") |> render_click() =~
               "Edit Product"

      assert_patch(index_live, ~p"/products/#{product}/edit")

      assert index_live
             |> form("#product-form", product: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#product-form", product: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/products")

      html = render(index_live)
      assert html =~ "Product updated successfully"
      assert html =~ "some updated extra_field_8"
    end

    test "deletes product in listing", %{conn: conn, product: product} do
      {:ok, index_live, _html} = live(conn, ~p"/products")

      assert index_live |> element("#products-#{product.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#products-#{product.id}")
    end
  end

  describe "Show" do
    setup [:create_product]

    test "displays product", %{conn: conn, product: product} do
      {:ok, _show_live, html} = live(conn, ~p"/products/#{product}")

      assert html =~ "Show Product"
      assert html =~ product.extra_field_8
    end

    test "updates product within modal", %{conn: conn, product: product} do
      {:ok, show_live, _html} = live(conn, ~p"/products/#{product}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Product"

      assert_patch(show_live, ~p"/products/#{product}/show/edit")

      assert show_live
             |> form("#product-form", product: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#product-form", product: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/products/#{product}")

      html = render(show_live)
      assert html =~ "Product updated successfully"
      assert html =~ "some updated extra_field_8"
    end
  end
end
