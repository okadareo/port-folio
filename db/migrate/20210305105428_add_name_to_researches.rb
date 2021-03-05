class AddNameToResearches < ActiveRecord::Migration[5.2]
  def change
    add_column :researches, :name, :string
  end
end
