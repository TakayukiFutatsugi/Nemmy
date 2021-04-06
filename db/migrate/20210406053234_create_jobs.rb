class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :client, foreign_key: true, null: false
      t.string :title
      t.integer :status
      t.string :salary
      t.string :benefitProgram
      t.string :holiday
      t.string :language
      t.string :framework
      t.string :characteristics
      t.string :skillset
      t.string :selectionProcess
      t.string :training
      t.date :startingDate
      t.integer :workplace
      t.string :access
      t.text :description
      t.timestamps
    end
  end
end
