class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,    null: false, foreign_key: { to_table: :users }
      t.string :name_first,    null: true, foreign_key: true
      t.string :name_last,     null: true, foreign_key: true 
      t.string :name_kana_first, null: true, foreign_key: true
      t.string :name_kana_last, null: true, foreign_key: true 
      t.string :post_number,  null: false
      t.integer :prefecture,   null: false
      t.string :city,          null: false
      t.string :house_number,    null: false
      t.string :building,      null: true
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
