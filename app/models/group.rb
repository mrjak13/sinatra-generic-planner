class Group < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_many :users, through: :events

end