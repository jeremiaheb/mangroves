class EditLatLonFields < ActiveRecord::Migration
  def up
  
    change_column :samples, :latitude, :decimal
    change_column :samples, :longitude, :decimal

  end

  def down
  end
end
