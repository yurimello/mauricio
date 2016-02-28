class AddFieldsToModifiers < ActiveRecord::Migration[5.0]
  def change
    add_column :modifiers, :method, :string
    remove_column :modifiers, :captures, :binary
    remove_column :modifiers, :value, :string
  end
end
