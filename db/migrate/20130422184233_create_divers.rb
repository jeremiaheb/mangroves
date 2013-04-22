class CreateDivers < ActiveRecord::Migration
  def change
    create_table :divers do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
