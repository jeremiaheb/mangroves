class Sample < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false

  belongs_to :diver
  has_many :sample_animals, :dependent => :destroy
  validates_presence_of :sample_animals, :message => "you must have at leat one species record (can be NO FISH)"
  has_many :animals, :through => :sample_animals
  accepts_nested_attributes_for :sample_animals, :reject_if => lambda {  |a| a[:animal_id].blank? }, :allow_destroy => true

  attr_accessible :diver_id, :sample_date, :running_site, :reference_site, :sample_time, :latitude, :longitude, :shoreline_cd, :mangrove_spp, :underwater_habitat, :temperature, :salinity, :dissolved_oxygen, :ph, :visibility, :depth_meter_0, :depth_meter_15, :depth_meter_30, :canopy_width, :canopy_height, :notes, :sample_animals_attributes

  def myId
    return self.diver_id
  end

  def msn
    return [ self.date.strftime('%Y%m%d'), self.field_id, self.diver.lastname.downcase ].join('')
  end

  def shoreline_options
   return [ ["Fringe", 1], ["Overwash", 2], ["Island", 3], ["Dwarf", 4], ["Scrub", 5] ]
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

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |sample|
        csv << sample.attributes.values_at(*column_names)
      end
    end
  end




end
