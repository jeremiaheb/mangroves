class Diver < ActiveRecord::Base

  has_many :samples

  attr_accessible :firstname, :lastname
end
