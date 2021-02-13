class RemovePropertyImageOIdFromEstates < ActiveRecord::Migration[5.2]
  def change
    remove_column :estates, :property_image_a_id, :string
  end
end
