class CreateReferenceSites < ActiveRecord::Migration
  def change
    create_table :reference_sites do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :strata

      t.timestamps
    end
  end
end
