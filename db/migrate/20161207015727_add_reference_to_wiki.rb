class AddReferenceToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :reference_id, :integer
  end
end
