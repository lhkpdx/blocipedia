class AddSubscriberAndStripeidToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscriber, :boolean
    add_column :users, :stripeid, :string
  end
end
