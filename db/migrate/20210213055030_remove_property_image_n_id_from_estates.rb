class RemovePropertyImageNIdFromEstates < ActiveRecord::Migration[5.2]
  def change
    remove_column :estates, :property_image_n_id, :string
  end
end
