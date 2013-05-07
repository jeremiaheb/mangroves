class EditSampleFields < ActiveRecord::Migration
  def up

     remove_column :samples,  :field_id
     remove_column :samples,  :season
     remove_column :samples,  :strata
     remove_column :samples,  :avg_depth

     rename_column :samples, :date, :sample_date

     add_column :samples,   :running_site, :string
     add_column :samples,   :reference_site, :string
     add_column :samples,   :sample_time, :time
     add_column :samples,   :ph, :decimal
     add_column :samples,   :depth_meter_0, :decimal
     add_column :samples,   :depth_meter_15, :decimal
     add_column :samples,   :depth_meter_30, :decimal
     add_column :samples,   :shoreline_cd, :integer
     add_column :samples,   :mangrove_spp, :text
     add_column :samples,   :underwater_habitat, :text
     add_column :samples,   :canopy_width, :decimal
     add_column :samples,   :canopy_height, :decimal
     add_column :samples,   :notes, :text
      

  end

  def down
  end
end
