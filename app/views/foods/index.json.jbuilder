json.array!(@foods) do |food|
  json.extract! food, :id, :name, :desc, :price, :category
  json.url food_url(food, format: :json)
end
