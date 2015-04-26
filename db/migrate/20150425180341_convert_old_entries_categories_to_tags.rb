class ConvertOldEntriesCategoriesToTags < ActiveRecord::Migration
  def change
  	Item.all.each do |item|
  		item.tag_list.add(item.name.split(","))
  	end
  end
end
