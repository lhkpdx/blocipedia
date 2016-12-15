class CreateWikiEvents < ActiveRecord::Migration
  def change
    create_table :wiki_events do |t|
      t.string :action
      t.references :user, foreign_key: true
      t.references :wiki, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
