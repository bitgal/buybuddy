class Store < ActiveRecord::Base
 	validates :name, presence: true
 	#toDo add addresses model to be nested in store
end
