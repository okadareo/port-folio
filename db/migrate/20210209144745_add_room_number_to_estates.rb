class AddRoomNumberToEstates < ActiveRecord::Migration[5.2]
  def change
    add_column :estates, :room_number, :integer
  end
end
