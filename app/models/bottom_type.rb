class BottomType < ActiveRecord::Base
  has_many :sample_bottom_types, :dependent => :destroy
  has_many :samples, :through => :sample_bottom_types
  accepts_nested_attributes_for :sample_bottom_types, :allow_destroy => true

  attr_accessible :name, :description
end
