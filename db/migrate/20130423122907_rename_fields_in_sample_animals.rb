class RenameFieldsInSampleAnimals < ActiveRecord::Migration
  def up
    rename_column :sample_animals, :mean, :average_length
    rename_column :sample_animals, :min,  :min_length
    rename_column :sample_animals, :max,  :max_length

  end

  def down
  end
end
