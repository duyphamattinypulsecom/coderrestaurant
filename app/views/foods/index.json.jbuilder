json.array!(@foods) do |food|
  json.extract! food, :id, :name, :desc, :price, :category, :image_url
  json.url food_url(food, format: :json)
end
