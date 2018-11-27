class Event < ActiveRecord::Base
  belongs_to :user
  has_many :events_groups
  has_many :groups, throgh: :events_groups
end
