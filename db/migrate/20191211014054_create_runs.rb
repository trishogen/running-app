class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.datetime :date
      t.float :run_time
      t.string :mood
      t.string :notes
      t.integer :user_id
      t.integer :route_id
      t.timestamps
    end
  end
end
