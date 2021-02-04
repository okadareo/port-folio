class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :background_image
      t.string :name
      t.text :info
      t.string :address
      t.string :floor
      t.integer :price
      t.string :floor_image
      t.string :property_image

      t.timestamps
    end
  end
end
