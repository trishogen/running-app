class AddTitleToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :title, :string
  end
end
