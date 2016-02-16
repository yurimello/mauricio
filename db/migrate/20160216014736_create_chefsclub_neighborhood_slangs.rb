class CreateChefsclubNeighborhoodSlangs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefsclub_neighborhood_slangs do |t|
      t.string :slang
      t.string :translated

      t.timestamps
    end
  end
end
