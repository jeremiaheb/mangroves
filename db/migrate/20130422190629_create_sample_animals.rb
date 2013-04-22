class CreateSampleAnimals < ActiveRecord::Migration
  def change
    create_table :sample_animals do |t|
      t.integer :sample_id
      t.integer :animal_id
      t.integer :number_individuals
      t.integer :mean
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
