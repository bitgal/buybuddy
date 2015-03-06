class AddColumnsToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :name, :string
  	add_column :stores, :street, :string
  	add_column :stores, :house_nr, :integer
  	add_column :stores, :zip_code, :string, default: '10407'
  	add_column :stores, :city, :string, default: 'Berlin'
  	add_column :stores, :country, :string, default: 'Germany'
  end
end
