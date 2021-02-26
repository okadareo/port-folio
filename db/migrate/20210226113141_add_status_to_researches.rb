class AddStatusToResearches < ActiveRecord::Migration[5.2]
  def change
    add_column :researches, :status, :boolean, default: false, null: true
  end
end
