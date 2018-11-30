class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name
      t.integer  :user_id
      t.string   :description
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
