class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :item, foreign_key: { to_table: :items }
      t.text :image, null: false
      t.timestamps
    end
  end
end
