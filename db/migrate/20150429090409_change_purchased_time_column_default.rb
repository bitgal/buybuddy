class ChangePurchasedTimeColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default(:items, :purchased_time, nil)
  end
end
