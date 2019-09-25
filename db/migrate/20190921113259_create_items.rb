class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.string :price, null: false
      t.text :description, null: false
      t.references :buyer, null: true, foreign_key: { to_table: :users }
      t.references :seller, null: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
