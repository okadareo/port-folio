class AddPropertyImageAIdToEstates < ActiveRecord::Migration[5.2]
  def change
    add_column :estates, :property_image_a_id, :string
  end
end
