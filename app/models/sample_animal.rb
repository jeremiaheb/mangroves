class SampleAnimal < ActiveRecord::Base

  belongs_to :animal
  belongs_to :sample

  attr_accessible :animal_id, :number_individuals, :mean, :min, :max
end
