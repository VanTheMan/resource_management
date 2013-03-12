Fabricator(:item) do
  name { Faker::Lorem.words.join(' ').titlecase }
  description { Faker::Lorem.sentence }
  item_type { Settings.item_type.sample }
  code { Faker::Lorem.words(1).first.swapcase }
end