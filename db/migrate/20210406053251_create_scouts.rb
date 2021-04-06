class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|
      t.references :client, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :message
      t.timestamps
    end
  end
end
