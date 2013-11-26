class RemoveUnderwaterHabitatFromSamples < ActiveRecord::Migration
  def up
    remove_column :samples, :underwater_habitat
      end

  def down
    add_column :samples, :underwater_habitat, :string
  end
end
