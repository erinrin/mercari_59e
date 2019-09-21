class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.string :price, null: false
      t.text :description, null: false
      # t.integer :buyer_id, null: true, foreign_key: user_id
      # t.integer  :buyer_id, null: false, foreign_key: user_id
      t.timestamps
    end
  end
end
