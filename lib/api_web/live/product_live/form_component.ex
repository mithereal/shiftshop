defmodule ApiWeb.ProductLive.FormComponent do
  use ApiWeb, :live_component

  alias Api.Products

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage product records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="product-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:skuinfo]} type="number" label="Skuinfo" />
        <.input field={@form[:mfgid]} type="text" label="Mfgid" />
        <.input field={@form[:short_description]} type="text" label="Short description" />
        <.input field={@form[:manufacturer_id]} type="number" label="Manufacturer" />
        <.input field={@form[:manufacturer_name]} type="text" label="Manufacturer name" />
        <.input field={@form[:distributor_list]} type="text" label="Distributor list" />
        <.input field={@form[:last_update]} type="text" label="Last update" />
        <.input field={@form[:user_id]} type="text" label="User" />
        <.input field={@form[:gtin]} type="text" label="Gtin" />
        <.input field={@form[:category_list]} type="text" label="Category list" />
        <.input field={@form[:external_ids_list]} type="text" label="External ids list" />
        <.input field={@form[:category_external_ids_list]} type="text" label="Category external ids list" />
        <.input field={@form[:non_taxable]} type="text" label="Non taxable" />
        <.input field={@form[:not_for_sale]} type="text" label="Not for sale" />
        <.input field={@form[:hide]} type="text" label="Hide" />
        <.input field={@form[:gift_certificate]} type="text" label="Gift certificate" />
        <.input field={@form[:home_special]} type="text" label="Home special" />
        <.input field={@form[:category_special]} type="text" label="Category special" />
        <.input field={@form[:non_searchable]} type="text" label="Non searchable" />
        <.input field={@form[:gift_wrap_item]} type="text" label="Gift wrap item" />
        <.input field={@form[:ship_cost]} type="number" label="Ship cost" step="any" />
        <.input field={@form[:weight]} type="number" label="Weight" step="any" />
        <.input field={@form[:height]} type="number" label="Height" step="any" />
        <.input field={@form[:width]} type="number" label="Width" step="any" />
        <.input field={@form[:depth]} type="number" label="Depth" step="any" />
        <.input field={@form[:self_ship]} type="number" label="Self ship" step="any" />
        <.input field={@form[:free_shipping]} type="number" label="Free shipping" step="any" />
        <.input field={@form[:reward_points]} type="number" label="Reward points" />
        <.input field={@form[:redeem_points]} type="number" label="Redeem points" />
        <.input field={@form[:disable_rewards]} type="number" label="Disable rewards" />
        <.input field={@form[:stock_alert]} type="number" label="Stock alert" />
        <.input field={@form[:reorder_quantity]} type="number" label="Reorder quantity" />
        <.input field={@form[:in_stock_message]} type="text" label="In stock message" />
        <.input field={@form[:out_of_stock_message]} type="text" label="Out of stock message" />
        <.input field={@form[:back_order_message]} type="text" label="Back order message" />
        <.input field={@form[:inventory_control]} type="text" label="Inventory control" />
        <.input field={@form[:warehouse_location]} type="text" label="Warehouse location" />
        <.input field={@form[:warehouse_bin]} type="text" label="Warehouse bin" />
        <.input field={@form[:warehouse_aisle]} type="text" label="Warehouse aisle" />
        <.input field={@form[:warehouse_custom]} type="text" label="Warehouse custom" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:keywords]} type="text" label="Keywords" />
        <.input field={@form[:extra_field_1]} type="text" label="Extra field 1" />
        <.input field={@form[:extra_field_2]} type="text" label="Extra field 2" />
        <.input field={@form[:extra_field_3]} type="text" label="Extra field 3" />
        <.input field={@form[:extra_field_4]} type="text" label="Extra field 4" />
        <.input field={@form[:extra_field_5]} type="text" label="Extra field 5" />
        <.input field={@form[:extra_field_6]} type="text" label="Extra field 6" />
        <.input field={@form[:extra_field_7]} type="text" label="Extra field 7" />
        <.input field={@form[:extra_field_8]} type="text" label="Extra field 8" />
        <.input field={@form[:extra_field_9]} type="text" label="Extra field 9" />
        <.input field={@form[:extra_field_10]} type="text" label="Extra field 10" />
        <.input field={@form[:extra_field_11]} type="text" label="Extra field 11" />
        <.input field={@form[:extra_field_12]} type="text" label="Extra field 12" />
        <.input field={@form[:extra_field_13]} type="text" label="Extra field 13" />
        <.input field={@form[:feature_list]} type="text" label="Feature list" />
        <.input field={@form[:plugin_list]} type="text" label="Plugin list" />
        <.input field={@form[:sample_enable]} type="text" label="Sample enable" />
        <.input field={@form[:sample_name]} type="text" label="Sample name" />
        <.input field={@form[:sample_skuprefix]} type="text" label="Sample skuprefix" />
        <.input field={@form[:sample_price]} type="number" label="Sample price" step="any" />
        <.input field={@form[:sample_weight]} type="number" label="Sample weight" step="any" />
        <.input field={@form[:review_average]} type="number" label="Review average" step="any" />
        <.input field={@form[:review_count]} type="number" label="Review count" />
        <.input field={@form[:main_image_file]} type="text" label="Main image file" />
        <.input field={@form[:main_image_caption]} type="text" label="Main image caption" />
        <.input field={@form[:thumbnail_file]} type="text" label="Thumbnail file" />
        <.input field={@form[:media_file]} type="text" label="Media file" />
        <.input field={@form[:additional_image_file_2]} type="text" label="Additional image file 2" />
        <.input field={@form[:additional_image_caption_2]} type="text" label="Additional image caption 2" />
        <.input field={@form[:additional_image_file_3]} type="text" label="Additional image file 3" />
        <.input field={@form[:additional_image_caption_3]} type="text" label="Additional image caption 3" />
        <.input field={@form[:additional_image_file_4]} type="text" label="Additional image file 4" />
        <.input field={@form[:additional_image_caption_4]} type="text" label="Additional image caption 4" />
        <.input field={@form[:image_gallery_list]} type="text" label="Image gallery list" />
        <.input field={@form[:option_set_list]} type="text" label="Option set list" />
        <.input field={@form[:advanced_option_list]} type="text" label="Advanced option list" />
        <.input field={@form[:related_product_list]} type="text" label="Related product list" />
        <.input field={@form[:up_selling_item_list]} type="text" label="Up selling item list" />
        <.input field={@form[:discount_list]} type="text" label="Discount list" />
        <.input field={@form[:do_not_use_category_options]} type="text" label="Do not use category options" />
        <.input field={@form[:date_created]} type="text" label="Date created" />
        <.input field={@form[:listing_template_id]} type="number" label="Listing template" />
        <.input field={@form[:listing_template_name]} type="text" label="Listing template name" />
        <.input field={@form[:login_required_option_id]} type="number" label="Login required option" />
        <.input field={@form[:login_required_option_name]} type="text" label="Login required option name" />
        <.input field={@form[:login_required_option_redirect_to]} type="text" label="Login required option redirect to" />
        <.input field={@form[:allow_access_customer_group_id]} type="number" label="Allow access customer group" />
        <.input field={@form[:allow_access_customer_group_name]} type="text" label="Allow access customer group name" />
        <.input field={@form[:rmamax_period]} type="text" label="Rmamax period" />
        <.input field={@form[:canonical_url]} type="text" label="Canonical url" />
        <.input field={@form[:tax_code]} type="text" label="Tax code" />
        <.input field={@form[:display_text]} type="text" label="Display text" />
        <.input field={@form[:minimum_quantity]} type="number" label="Minimum quantity" step="any" />
        <.input field={@form[:maximum_quantity]} type="number" label="Maximum quantity" step="any" />
        <.input field={@form[:allow_only_multiples]} type="number" label="Allow only multiples" step="any" />
        <.input field={@form[:allow_fractional_quantity]} type="number" label="Allow fractional quantity" step="any" />
        <.input field={@form[:quantity_options]} type="text" label="Quantity options" />
        <.input field={@form[:group_options_for_quantity_pricing]} type="text" label="Group options for quantity pricing" />
        <.input field={@form[:apply_quantity_discount_to_options]} type="text" label="Apply quantity discount to options" />
        <.input field={@form[:enable_make_an_offer_feature]} type="text" label="Enable make an offer feature" />
        <.input field={@form[:minimum_acceptable_offer]} type="text" label="Minimum acceptable offer" />
        <.input field={@form[:price_level_1]} type="number" label="Price level 1" step="any" />
        <.input field={@form[:price_level_1_hide]} type="number" label="Price level 1 hide" step="any" />
        <.input field={@form[:price_level_2]} type="number" label="Price level 2" step="any" />
        <.input field={@form[:price_level_2_hide]} type="number" label="Price level 2 hide" step="any" />
        <.input field={@form[:price_level_3]} type="number" label="Price level 3" step="any" />
        <.input field={@form[:price_level_3_hide]} type="number" label="Price level 3 hide" step="any" />
        <.input field={@form[:price_level_4]} type="number" label="Price level 4" step="any" />
        <.input field={@form[:price_level_4_hide]} type="number" label="Price level 4 hide" step="any" />
        <.input field={@form[:price_level_5]} type="number" label="Price level 5" step="any" />
        <.input field={@form[:price_level_5_hide]} type="number" label="Price level 5 hide" step="any" />
        <.input field={@form[:price_level_6]} type="number" label="Price level 6" step="any" />
        <.input field={@form[:price_level_6_hide]} type="number" label="Price level 6 hide" step="any" />
        <.input field={@form[:price_level_7]} type="number" label="Price level 7" step="any" />
        <.input field={@form[:price_level_7_hide]} type="number" label="Price level 7 hide" step="any" />
        <.input field={@form[:price_level_8]} type="number" label="Price level 8" step="any" />
        <.input field={@form[:price_level_8_hide]} type="number" label="Price level 8 hide" step="any" />
        <.input field={@form[:price_level_9]} type="number" label="Price level 9" step="any" />
        <.input field={@form[:price_level_9_hide]} type="number" label="Price level 9 hide" step="any" />
        <.input field={@form[:price_level_10]} type="number" label="Price level 10" step="any" />
        <.input field={@form[:price_level_10_hide]} type="number" label="Price level 10 hide" step="any" />
        <.input field={@form[:buy_button_link]} type="text" label="Buy button link" />
        <.input field={@form[:product_link]} type="text" label="Product link" />
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:custom_file_name]} type="text" label="Custom file name" />
        <.input field={@form[:redirect_link]} type="text" label="Redirect link" />
        <.input field={@form[:meta_tags]} type="text" label="Meta tags" />
        <.input field={@form[:special_instructions]} type="text" label="Special instructions" />
        <.input field={@form[:assign_key]} type="text" label="Assign key" />
        <.input field={@form[:re_use_keys]} type="text" label="Re use keys" />
        <.input field={@form[:serial_list]} type="text" label="Serial list" />
        <.input field={@form[:eproduct_list]} type="text" label="Eproduct list" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Product</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{product: product} = assigns, socket) do
    changeset = Products.change_product(product)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"product" => product_params}, socket) do
    changeset =
      socket.assigns.product
      |> Products.change_product(product_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"product" => product_params}, socket) do
    save_product(socket, socket.assigns.action, product_params)
  end

  defp save_product(socket, :edit, product_params) do
    case Products.update_product(socket.assigns.product, product_params) do
      {:ok, product} ->
        notify_parent({:saved, product})

        {:noreply,
         socket
         |> put_flash(:info, "Product updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_product(socket, :new, product_params) do
    case Products.create_product(product_params) do
      {:ok, product} ->
        notify_parent({:saved, product})

        {:noreply,
         socket
         |> put_flash(:info, "Product created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
