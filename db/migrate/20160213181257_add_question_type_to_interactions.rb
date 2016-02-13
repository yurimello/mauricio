class AddQuestionTypeToInteractions < ActiveRecord::Migration[5.0]
  def change
    add_column :interactions, :question_type, :string
    add_column :interactions, :captures, :text
  end
end
