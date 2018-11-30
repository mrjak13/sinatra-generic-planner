class Group < ActiveRecord::Base

  validates :name, uniqueness: true

  has_and_belongs_to_many :events
  has_many :users, through: :events
end
