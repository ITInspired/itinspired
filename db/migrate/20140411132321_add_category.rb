class AddCategory < ActiveRecord::Migration
  def change
  	add_column :posts, :interesting, :string
  end
end
