class AddWikiToReference < ActiveRecord::Migration
  def change
    add_column :references, :wiki_id, :integer
    add_index :references, :wiki_id
  end
end
