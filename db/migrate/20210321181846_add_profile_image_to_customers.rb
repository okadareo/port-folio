class AddProfileImageToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :profile_image, :string
  end
end
