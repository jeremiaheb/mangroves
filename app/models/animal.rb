class Animal < ActiveRecord::Base
  has_many :sample_animals, :dependent => :destroy
  has_many :samples, :through => :sample_animals
  accepts_nested_attributes_for :sample_animals, :allow_destroy => true

  attr_accessible :spp_code, :scientific_name, :common_name

  def searchable_name
    [self.spp_code, self.common_name].join('___')
  end

end
