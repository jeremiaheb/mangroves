class AddUsernameToDiver < ActiveRecord::Migration
  def change
    add_column :divers, :username, :string

  end
end
