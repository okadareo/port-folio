class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.integer :admin_id
      t.string :background_image_id
      t.string :name
      t.text :info
      t.string :address
      t.string :floor
      t.integer :price
      t.string :floor_image_id
      t.string :property_image_a_id
      t.string :property_image_b_id
      t.string :property_image_c_id
      t.string :property_image_d_id
      t.string :property_image_e_id
      t.string :property_image_f_id
      t.string :property_image_g_id
      t.string :property_image_h_id
      t.string :property_image_i_id
      t.string :property_image_j_id
      t.string :property_image_k_id
      t.string :property_image_l_id
      t.timestamps
    end
  end
end
