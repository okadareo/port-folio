class RemoveRoomNumberFromResearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :researches, :room_number, :integer
  end
end
