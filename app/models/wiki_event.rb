class WikiEvent < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
end
