Fabricator(:item) do
  name { Faker::Lorem.words.join(' ').titlecase }
  description { Faker::Lorem.paragraphs(2).join(' ') }
  status 'Available'
  item_type { Settings.item_type.sample }
  quantity { rand(0..10) }
end