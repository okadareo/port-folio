class CreateResearchs < ActiveRecord::Migration[5.2]
  def change
    create_table :researchs do |t|
      t.integer :customer_id
      t.integer :estate_id

      t.timestamps
    end
  end
end
