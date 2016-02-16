class CreateModifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :modifiers do |t|
      t.text :expression
      t.string :modifier_type
      t.binary :captures
      t.string :value

      t.timestamps
    end
  end
end
