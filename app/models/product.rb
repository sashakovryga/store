class Product < ActiveRecord::Base
  default_scope :order => 'title'
has_many :line_items
before_destroy :ensure_not_referenced_by_any_line_item
   attr_accessible :camera, :chastota, :core, :description, :diagonal, :god, :image_url, :op, :os, :price, :resolution, :time, :title, :volume
  validates :camera, :chastota, :core, :description, :diagonal, :god, :image_url, :op, :os, :price, :resolution, :time, :title, :volume, :presence => true
  validates :price, :numericality=>{:greater_than_or_equal_to=>0.01}
  validates :diagonal, :numericality=>{:greater_than_or_equal_to=>0.1}
  validates :title, :uniqueness=>true
  validates :image_url, :allow_blank=>true, :format=> {
:with=> %r{\.(gif|jpg|png)$}i,
:message=>'URL должен быть в форматах GIF,JPG,PNG'
}
  validates :camera,:chastota, :core, :god,:op, :volume, :numericality=>true
  validates :resolution, :format=> {
:with=> %r{^[0-9]\*([0-9])$}i,
:message=>'Разрешение должно быть в формате 1234*1234'
}
validates :time, :format=> {
:with=> %r{^[0-9]\-[0-9]$}i,
:message=>'Время должно быть указано по примеру 6-7'
}

def ensure_not_referenced_by_any_line_item
if line_items.count.zero?
return true
else
errors.add(:base, 'Line Items present' )
return false
end
end
end
