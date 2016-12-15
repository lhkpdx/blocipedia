class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis
  has_many :news
  has_many :wiki_events
  before_save { self.role ||= :standard }
  enum role: [:standard, :premium, :admin]

end
