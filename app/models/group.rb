class Group < ActiveRecord::Base
  has_many :events_groups
  has_many :events, through: :events_groups
  has_many :users, through: :events
end
