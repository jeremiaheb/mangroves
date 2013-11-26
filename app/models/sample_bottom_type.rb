class SampleBottomType < ActiveRecord::Base
belongs_to :sample
belongs_to :bottom_type

attr_accessible :bottom_type_id

    
end
