class RemoveIsValidFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :is_valid, :boolean
  end
end
