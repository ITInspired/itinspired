class Addcolumn < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :integer
  	add_column :users, :last_name, :integer
  end
end
