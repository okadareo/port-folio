class RemoveNameFromResearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :researches, :name, :string
  end
end
