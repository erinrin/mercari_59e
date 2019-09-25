class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string  :uid
      t.string  :provider
      t.timestamps
    end
  end
end
