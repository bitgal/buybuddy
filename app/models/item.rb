class Item < ActiveRecord::Base
	belongs_to :category
 	accepts_nested_attributes_for :category
 	# belongs_to :sub_category
 	# accepts_nested_attributes_for :sub_category
 	belongs_to :store
 	accepts_nested_attributes_for :store

 	validates :name, presence: true
 	validates :category, presence: true
 	validates :store, presence: true
 	validates :price, presence: true

 	scope :name, -> (name) { where name: name }
	scope :category, -> (category) { where category: category}
	scope :store, -> (store) { where store: store}


 	def matched_subcategories
 		@matched_subcategories = SubCategory.find(category_id = self.category_id)
 	end
end
