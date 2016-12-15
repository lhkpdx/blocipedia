class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :references
  has_many :wiki_events

end
