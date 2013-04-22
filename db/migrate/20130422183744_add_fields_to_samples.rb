class AddFieldsToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :diver_id, :integer

    add_column :samples, :field_id, :string

    add_column :samples, :season, :string

    add_column :samples, :strata, :string

    add_column :samples, :date, :date

    add_column :samples, :latitude, :decimal

    add_column :samples, :longitude, :decimal

    add_column :samples, :temperature, :decimal

    add_column :samples, :dissolved_oxygen, :decimal

    add_column :samples, :salinity, :decimal

    add_column :samples, :avg_depth, :decimal

    add_column :samples, :visibility, :decimal

  end
end
