class Sample < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false

  belongs_to :diver
  has_many :sample_animals, :dependent => :destroy
  validates_presence_of :sample_animals, :message => "you must have at leat one species record (can be NO FISH)"
  has_many :animals, :through => :sample_animals
  accepts_nested_attributes_for :sample_animals, :reject_if => lambda {  |a| a[:animal_id].blank? }, :allow_destroy => true


  has_many :sample_bottom_types, :dependent => :destroy
  has_many :bottom_types, :through => :sample_bottom_types
  accepts_nested_attributes_for :sample_bottom_types, :reject_if => lambda {  |a| a[:bottom_type_id].blank? }, :allow_destroy => true


  attr_accessible :diver_id, :sample_date, :running_site, :reference_site, :sample_time, :latitude, :longitude, :shoreline_cd, :mangrove_spp, :underwater_habitat, :temperature, :salinity, :dissolved_oxygen, :ph, :visibility, :depth_meter_0, :depth_meter_15, :depth_meter_30, :canopy_width, :canopy_height, :notes, :sample_animals_attributes, :sample_bottom_types_attributes, :bottom_type_1, :bottom_type_2, :bottom_type_3, :bottom_type_4, :bottom_type_5

  def myId
    return self.diver_id
  end

  def msn
    return [ self.sample_date.strftime('%Y%m%d'), self.running_site, self.diver.lastname.downcase ].join('')
  end

  SHORELINES = [ ["Fringe", 1], ["Overwash", 2], ["Island", 3], ["Dwarf", 4], ["Scrub", 5] ]


  MANGROVES = [ ["red", "red"], ["black", "black"], ["white", "white"],
                ["buttonwood", "buttonwood"] ]



  def gmaps4rails_infowindow
    "<b>#{self.running_site}</b><br />
    #{self.latitude}, #{self.longitude}<br />
    Date Completed: #{self.sample_date}"
  end

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end

  def gmaps4rails_title
    "#{self.running_site}"
  end



end
