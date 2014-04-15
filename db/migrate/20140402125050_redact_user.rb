class RedactUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
 		t.remove :first_name, :last_name
 		t.string :first_name
  		t.string :last_name
	end
  end
end
