Fabricator(:item) do
  name { Faker::Lorem.words.join(' ').titlecase }
  description { Faker::Lorem.sentence }
  status 'Available'
  item_type { Settings.item_type.sample }
  quantity { rand(0..10) }
end