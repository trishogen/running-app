class AddCreatorToRoute < ActiveRecord::Migration[5.2]
  def change
    # Notice how the index is for :creator but references users
    add_reference :routes, :creator, references: :users, index: true

    # Just like the belongs_to contained class_name: :User, the foreign key
    # also needs a specific custom column name as :creator_id
    add_foreign_key :routes, :users, column: :creator_id
  end
end
