ActiveAdmin.register Order do

  filter :total_price
  filter :checked_out_at

  scope :all, :default => true
 

  index do
    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Name", :name)
    column("Address", :address)
    column("Email" , :email)
    column("Login", :login)
    column("Pay type", :pay_type)
     column("Total") {|order| number_to_currency order.total_price }
     column("Date", :created_at)
     default_actions
  end

  show do
    panel "Invoice" do
      table_for(order.line_items) do |t|
        t.column("Product") {|item| auto_link item.product }
        t.column("Amount") {|item| auto_link item.quantity }
        t.column("Price") {|item| number_to_currency item.product.price }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          td number_to_currency(order.total_price)
        end
      end
    end

    active_admin_comments
  end



 
end

  