class CreateFavoriteEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_estates do |t|
      t.integer :customer_id
      t.integer :estate_id

      t.timestamps
    end
  end
end
