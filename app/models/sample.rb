class Sample < ActiveRecord::Base

  belongs_to :diver
  has_many :sample_animals, :dependent => :destroy
  validates_presence_of :sample_animals, :message => "you must have at leat one species record (can be NO FISH)"
  has_many :animals, :through => :sample_animals
  accepts_nested_attributes_for :sample_animals, :reject_if => lambda {  |a| a[:animal_id].blank? }, :allow_destroy => true

  attr_accessible :diver_id, :date, :field_id, :season, :strata, :latitude, :longitude, :temperature, :dissolved_oxygen, :salinity, :avg_depth, :visibility, :sample_animals_attributes

end
