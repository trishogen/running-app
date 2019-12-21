class AddDescriptionToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :description, :string
  end
end
