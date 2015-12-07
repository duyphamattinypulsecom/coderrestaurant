# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..20).each do |i|
  food_name = Faker::SlackEmoji.food_and_drink[1..-2]    # remove ":" in :food: at the beginning and the end
  food = Food.create(
      name: food_name,
      desc: Faker::Lorem.paragraph(2, true, 4),
      price: Faker::Commerce.price,
      category: ["breakfast", "lunch", "dinner", "drinks"].sample,  # breakfast, lunch, dinner, drinks
      image_url: "http://loremflickr.com/320/240/#{food_name}?random=#{i}"
  )
  (1..rand(5)).each do
    food.reviews << Review.new(rate: rand(5)+1, comment: Faker::Lorem.paragraph)
  end
end
