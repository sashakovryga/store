class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :god
      t.text :description
      t.decimal :diagonal
      t.integer :os
      t.integer :op
      t.integer :volume
      t.integer :chastota
      t.integer :core
      t.string :resolution
      t.integer :camera
      t.integer :time
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
