class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :title
      t.string :location
      t.float :distance
      t.integer :elevation
      t.timestamps
    end
  end
end
