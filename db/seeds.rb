# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in (1..3) do
  Fabricate(:user, email: "user#{i}@rsms.com")
end

10.times do
  Fabricate(:item, item_image: File.open("#{Rails.root}/app/assets/images/items/#{rand(1..5)}.png"),
                   borrower: User.all.sample)
end