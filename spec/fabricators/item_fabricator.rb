Fabricator(:item) do
  name { Faker::Lorem.words.join(' ').titlecase }
  description { Faker::Lorem.sentence }
  item_type { Settings.item_type.sample }
  quantity { rand(0..10) }
end