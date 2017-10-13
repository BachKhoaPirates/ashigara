p "seeding sexes"
Sex.create! name: "Male"
Sex.create! name: "Female"
Sex.create! name: "Unknown"

p "seeding 100 users"
user = User.new email: "a@a.com",
  password: "123123",
  username: Faker::Name.name,
  dob: Faker::Date.backward,
  sexes_id: rand(1..3),
  foot_length: rand(20..30),
  foot_width: rand(10..15)
user.skip_confirmation!
user.save!

user = User.new email: "b@b.com",
  password: "123123",
  username: Faker::Name.name,
  dob: Faker::Date.backward,
  sexes_id: rand(1..3),
  foot_length: rand(20..30),
  foot_width: rand(10..15)
user.skip_confirmation!
user.save!

user = User.new email: "c@cv.com",
  password: "123123",
  username: Faker::Name.name,
  dob: Faker::Date.backward,
  sexes_id: rand(1..3),
  foot_length: rand(20..30),
  foot_width: rand(10..15)
user.skip_confirmation!
user.save!

97.times do
  user = User.new email: Faker::Internet.email,
    password: "123123",
    username: Faker::Name.name,
    dob: Faker::Date.backward,
    sexes_id: rand(1..3),
    foot_length: rand(20..30),
    foot_width: rand(10..15)
  user.skip_confirmation!
  user.save!
end

p "seeding categories"
Category.create! name: "Aerobic Shoes"
Category.create! name: "Airport Friendly Shoes"
Category.create! name: "Aldo Men's Shoes"
Category.create! name: "Asics Shoeseels"
Category.create! name: "Camper Shoes"
Category.create! name: "Satin Shoes"
Category.create! name: "Snow Boots"
Category.create! name: "Soccer Cleats"
Category.create! name: "Sorel Boots"
Category.create! name: "Summer Shoes"
Category.create! name: "Tan Boots"
Category.create! name: "Wide Shoes"
Category.create! name: "Winter Boots"
Category.create! name: "Womens Boots"
Category.create! name: "Work Shoes"
Category.create! name: "Wrestling Shoes"
Category.create! name: "Zip Up Boots"

p "seeding brands"
Brand.create! name: "A2 by Aerosoles"
Brand.create! name: "Adidas"
Brand.create! name: "Bass"
Brand.create! name: "Bates"
Brand.create! name: "Bogs"
Brand.create! name: "Dockers"
Brand.create! name: "Dr. Mar"
Brand.create! name: "Kensie Girl"
Brand.create! name: "Khombuauren"
Brand.create! name: "Propet"
Brand.create! name: "Puma"
Brand.create! name: "Rocket Dog"
Brand.create! name: "Rockport"
Brand.create! name: "Rockport Work"
Brand.create! name: "Steve Madden"
Brand.create! name: "Stride R"
Brand.create! name: "Thomas & Friends"
Brand.create! name: "Timberland"
Brand.create! name: "Timberland Pro"
Brand.create! name: "Vans"
Brand.create! name: "ZIGI SOHO"

p "seeding shoes"
1.upto(100) do
  Shoe.create! name: Faker::Company.name,
    durability: rand(1..5),
    comfortability: rand(1..5),
    ventilation: rand(1..5),
    overall: rand(1..5),
    water_proof: [true, false].sample,
    money_worthy: rand(1..5),
    released_date: Faker::Date.backward,
    category_id: rand(1..17),
    brand_id: rand(1..21)
end

p "seeding sizes"
1.upto(100) do |n|
  rand(3..5).times do
    Size.create! size: rand(28..38),
      shoe_id: n,
      foot_length: rand(20..30),
      foot_width: rand(10..15)
  end
end

p "seeding bookmarks"
1.upto(100) do |n|
  Bookmark.create! user_id: rand(1..100),
    shoe_id: n
end

p "seeding shops"
1.upto(100) do
  Shop.create! name: Faker::Company.name,
    address: Faker::Address.street_address
end

p "seeding shoe shop"
1.upto(100) do |n|
  rand(3..5).times do
    ShoeShop.create! shoe_id: n,
      shop_id: rand(1..100)
  end
end

p "seeding reviews"
1.upto(100) do |n|
  rand(3..5).times do
    Review.create! user_id: rand(1..100),
      shoe_id: n,
      content: Faker::HowIMetYourMother.quote,
      durability: rand(1..5),
      comfortability: rand(1..5),
      ventilation: rand(1..5),
      money_worthy: rand(1..5),
      vote_count: rand(-3..30)
  end
end

shoe_images = [
  "https://static.pexels.com/photos/19090/pexels-photo.jpg",
  "https://static.pexels.com/photos/345415/pexels-photo-345415.jpeg",
  "https://static.pexels.com/photos/267320/pexels-photo-267320.jpeg",
  "https://static.pexels.com/photos/267202/pexels-photo-267202.jpeg",
  "https://static.pexels.com/photos/298864/pexels-photo-298864.jpeg",
  "https://static.pexels.com/photos/51397/legs-window-car-dirt-road-51397.jpeg",
  "https://static.pexels.com/photos/17465/pexels-photo.jpg",
  "https://static.pexels.com/photos/292999/pexels-photo-292999.jpeg",
  "https://static.pexels.com/photos/298863/pexels-photo-298863.jpeg",
  "https://static.pexels.com/photos/234792/pexels-photo-234792.jpeg",
  "https://static.pexels.com/photos/293406/pexels-photo-293406.jpeg",
  "https://static.pexels.com/photos/267294/pexels-photo-267294.jpeg",
  "https://static.pexels.com/photos/404168/pexels-photo-404168.jpeg",
  "https://static.pexels.com/photos/267313/pexels-photo-267313.jpeg",
  "https://static.pexels.com/photos/247321/pexels-photo-247321.jpeg",
  "https://static.pexels.com/photos/373934/pexels-photo-373934.jpeg",
  "https://static.pexels.com/photos/266840/pexels-photo-266840.jpeg",
  "https://static.pexels.com/photos/292998/pexels-photo-292998.jpeg",
  "https://static.pexels.com/photos/6346/healthy-light-woman-legs.jpg",
  "https://static.pexels.com/photos/250356/pexels-photo-250356.jpeg",
  "https://static.pexels.com/photos/7432/pexels-photo.jpg",
  "https://static.pexels.com/photos/90365/pexels-photo-90365.jpeg",
  "https://static.pexels.com/photos/421160/pexels-photo-421160.jpeg",
  "https://static.pexels.com/photos/175689/pexels-photo-175689.jpeg",
  "https://static.pexels.com/photos/48262/pexels-photo-48262.jpeg",
  "https://static.pexels.com/photos/167706/pexels-photo-167706.jpeg",
  "https://static.pexels.com/photos/533547/pexels-photo-533547.jpeg",
  "https://static.pexels.com/photos/54334/running-shoe-shoe-brooks-highly-functional-54334.jpeg",
  "https://static.pexels.com/photos/327273/pexels-photo-327273.jpeg",
]

1.upto(100) do |n|
  rand(5..7).times do
    ShoeImage.create! shoe_id: n,
      image: shoe_images.sample
  end
end

p "seeding votes"
1.upto(100) do |n|
  rand(0..5).times do
    Vote.create! user_id: rand(1..100),
      review_id: n,
      vote_type: [-1, 1].sample
  end
end
