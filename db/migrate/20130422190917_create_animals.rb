class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :spp_code
      t.string :scientific_name
      t.string :common_name

      t.timestamps
    end
  end
end
