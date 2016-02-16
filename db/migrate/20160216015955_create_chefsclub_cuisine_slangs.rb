class CreateChefsclubCuisineSlangs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefsclub_cuisine_slangs do |t|
      t.string :slang
      t.string :translated

      t.timestamps
    end
  end
end
