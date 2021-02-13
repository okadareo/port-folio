class RemovePropertyImageMIdFromEstates < ActiveRecord::Migration[5.2]
  def change
    remove_column :estates, :property_image_m_id, :string
  end
end
