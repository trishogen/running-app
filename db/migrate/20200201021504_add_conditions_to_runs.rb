class AddConditionsToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :conditions, :string
  end
end
