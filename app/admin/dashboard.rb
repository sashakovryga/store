ActiveAdmin::Dashboards.build do
  section "Orders" do
   
          table_for Order.order('id desc').limit(10) do |order|
            column("Id") {|order| link_to "##{order.id} ", admin_order_path(order) } 
            column("Email"){|order| order.email }
            column("Total Price") { |order| number_to_currency order.total_price }
          end
      
  end
  section "Users" do
    table_for User.order('id desc').limit(10).each do |customer|
            column(:login) {|customer| customer.email}
          end
  end
end