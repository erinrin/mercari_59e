class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name_first,    null: true, foreign_key: true
      t.string :name_last,     null: true, foreign_key: true 
      t.string :name_kana_first, null: true, foreign_key: true
      t.string :name_kana_last, null: true, foreign_key: true 
      t.integer :post_number,  null: false
      t.integer :prefecture,   null: false
      t.string :city,          null: false
      t.text :house_number,    null: false
      t.string :building,      null: true
      t.integer :phone_number, null: false
      t.timestamps
    end
  end
end
