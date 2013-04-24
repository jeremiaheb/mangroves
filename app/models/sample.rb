class Sample < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false

  belongs_to :diver
  has_many :sample_animals, :dependent => :destroy
  validates_presence_of :sample_animals, :message => "you must have at leat one species record (can be NO FISH)"
  has_many :animals, :through => :sample_animals
  accepts_nested_attributes_for :sample_animals, :reject_if => lambda {  |a| a[:animal_id].blank? }, :allow_destroy => true

  attr_accessible :diver_id, :date, :field_id, :season, :strata, :latitude, :longitude, :temperature, :dissolved_oxygen, :salinity, :avg_depth, :visibility, :sample_animals_attributes

  def myId
    return self.diver_id
  end

  def gmaps4rails_infowindow
    "<b>#{self.field_id}</b><br />
    #{self.latitude}, #{self.longitude}<br />
    Date Completed: #{self.date}"
  end

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end

  def gmaps4rails_title
    "#{self.field_id}"
  end




end
