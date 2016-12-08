class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :name
      t.date :date
      t.string :link
      t.references :wiki, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
