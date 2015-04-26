class AddPurchaseDateToItems < ActiveRecord::Migration
  def up
  	add_column :items, :purchased_time, :datetime

  	Item.all.each do |item|
  		item.purchased_time = item.created_at
  		item.save!
  	end

		change_column_default(:items, :purchased_time, Time.now)  
	end
  def down
  	remove_column :items, :purchased_time
	end

end
