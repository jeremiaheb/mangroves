class CreateSampleBottomTypes < ActiveRecord::Migration
  def change
    create_table :sample_bottom_types do |t|
      t.integer :sample_id
      t.integer :bottom_type_id

      t.timestamps
    end
  end
end
