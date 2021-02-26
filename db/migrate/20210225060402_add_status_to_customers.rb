class AddStatusToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :status, :boolean, default: true, null: false 
  end
end
