class CreateBottomTypes < ActiveRecord::Migration
  def change
    create_table :bottom_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
