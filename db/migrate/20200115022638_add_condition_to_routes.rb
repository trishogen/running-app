class AddConditionToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :condition, :string
  end
end
