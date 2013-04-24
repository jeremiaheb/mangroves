class ChangeColumnTypesInSample < ActiveRecord::Migration
  def up
    change_column :samples, :latitude, :float
    change_column :samples, :longitude, :float

  end

  def down
  end
end
