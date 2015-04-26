json.array!(@items) do |item|
  json.extract! item, :id, :price, :tag_list, :category, :sub_category, :store
  json.url item_url(item, format: :json)
end
