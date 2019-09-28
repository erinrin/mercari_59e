class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.string :price, null: false
      t.text :description, null: false
      t.references :buyer, null: true, foreign_key: { to_table: :users }
      t.references :seller, null: true, foreign_key: { to_table: :users }
      t.integer :quality, null: false
      t.integer :fee, null: false
      t.integer :sendmethod, null: false
      t.integer :senddate, null: false
      t.integer :region, null: false
      t.timestamps
    end
  end
end
