class RenameCategoryToCategoryIdInItems < ActiveRecord::Migration
  def change
  	rename_column :items, :category, :category_id
  	rename_column :items, :sub_category, :sub_category_id
  	rename_column :items, :store, :store_id
  end
end
