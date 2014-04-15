class MakePolimorphic < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
 		t.remove :post_id, :user_id
 		t.integer :imageable_id
  		t.string :imageable_type
	end
  end
end
