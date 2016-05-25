class CreateCake < ActiveRecord::Migration
  def up
   create_table :cakes do |t|
   	 t.integer :cake_num
     t.string :name
   end
 end

 def down
   drop_table :cakes
 end
end
