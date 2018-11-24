class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :user_id
      t.string   :description
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
