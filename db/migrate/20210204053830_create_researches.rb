class CreateResearches < ActiveRecord::Migration[5.2]
  def change
    create_table :researches do |t|
      t.integer :customer_id
      t.integer :estate_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
