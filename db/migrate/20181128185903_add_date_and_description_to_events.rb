class AddDateAndDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :datetime
    add_column :events, :description, :string
  end
end
