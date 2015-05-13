class AddDefaultForTags < ActiveRecord::Migration
  def change
  	Item.all.each do |item|
  		unless item.tag_list.present? 
  			item.tag_list.add("misc")
  			item.save!
  		end
  	end
  end
end
