p "seeding sexes"
Sex.create! name: "Male"
Sex.create! name: "Female"
Sex.create! name: "Unknown"

p "seeding 100 users"
User.create! email: "a@a.com",
  password: "123123",
  username: Faker::Name.name,
  dob: Faker::Date.backward,
  sexes_id: rand(1..3),
  foot_length: rand(20..30),
  foot_width: rand(10..15)

User.create! email: "b@b.com",
  password: "123123",
  username: Faker::Name.name,
  dob: Faker::Date.backward,
  sexes_id: rand(1..3),
  foot_length: rand(20..30),
  foot_width: rand(10..15)

User.create! email: "c@cv.com",
  password: "123123",
  username: Faker::Name.name,
  dob: Faker::Date.backward,
  sexes_id: rand(1..3),
  foot_length: rand(20..30),
  foot_width: rand(10..15)

97.times do
  User.create! email: Faker::Internet.email,
    password: "123123",
    username: Faker::Name.name,
    dob: Faker::Date.backward,
    sexes_id: rand(1..3),
    foot_length: rand(20..30),
    foot_width: rand(10..15)
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
    categories_id: rand(1..17),
    brands_id: rand(1..21)
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
