ActiveAdmin.register User do
  index do
    column :id
    column(:login) {|customer| customer.email }
    column :created_at
    default_actions
  end
  
end
