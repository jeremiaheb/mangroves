class AddBottomTypesToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :bottom_type_1, :string

    add_column :samples, :bottom_type_2, :string

    add_column :samples, :bottom_type_3, :string

    add_column :samples, :bottom_type_4, :string

    add_column :samples, :bottom_type_5, :string

  end
end
