class Item < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
 	accepts_nested_attributes_for :category
 	# belongs_to :sub_category
 	# accepts_nested_attributes_for :sub_category
 	acts_as_taggable
  acts_as_taggable_on :tags
	
 	belongs_to :store
 	accepts_nested_attributes_for :store

 	#validates :tag_list, presence: true
 	validates :category, presence: true
 	validates :store, presence: true
 	validates :price, presence: true

 	def matched_subcategories
 		@matched_subcategories = SubCategory.find(category_id = self.category_id)
 	end
end
