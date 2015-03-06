class ChangeSubCategoryToSubCategoryIdOnItems < ActiveRecord::Migration
  def change
  	rename_column :items, :sub_category, :sub_category_id
  end
end
