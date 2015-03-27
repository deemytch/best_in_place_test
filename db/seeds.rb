3.times do |x|
  Cuisine.create name: Faker::Commerce.department(1)
end

5.times do |x|
  Dish.create name:Faker::Commerce.department(1), cuisine: Cuisine.first, code: SecureRandom.hex
end