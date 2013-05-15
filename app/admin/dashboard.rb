ActiveAdmin::Dashboards.build do
  section "Recent Products" do
    table_for Product.order("updated_at desc").limit(5) do
      column :title do |product|
        link_to product.title, admin_product_path(product)
      end
      column :updated_at
    end
    strong { link_to "View All Products", admin_products_path }
  end
end