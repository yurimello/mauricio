class AddParentIdToInteractions < ActiveRecord::Migration[5.0]
  def change
    add_column :interactions, :parent_id, :integer
  end
end
