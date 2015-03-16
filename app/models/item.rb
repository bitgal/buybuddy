class Item < ActiveRecord::Base
	belongs_to :category
 	accepts_nested_attributes_for :category
 	belongs_to :sub_category
 	accepts_nested_attributes_for :sub_category
 	belongs_to :store
 	accepts_nested_attributes_for :store
 	def matched_subcategories
 		@matched_subcategories = SubCategory.find(category_id = self.category_id)
 	end
end
