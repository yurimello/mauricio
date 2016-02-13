class AddUserToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :user, foreign_key: true
    add_column :messages, :from, :string
  end
end
