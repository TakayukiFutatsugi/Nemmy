class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :room, foreign_key: true, null: false
      t.boolean :is_user
      t.text :content
      t.timestamps
    end
  end
end
