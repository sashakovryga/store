class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  attr_accessible :product, :cart
  belongs_to :product
  belongs_to :cart
end
