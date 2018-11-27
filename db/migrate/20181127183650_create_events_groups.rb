class CreateEventsGroups < ActiveRecord::Migration
  def change
    create_join_table :events, :groups do |t|
      t.integer :event_id
      t.integer :group_id
    end
  end
end
