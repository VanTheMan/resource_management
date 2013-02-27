Fabricator(:user) do
  email { Faker::Internet.email }
  name { Faker::Name.name }
  password "vinova"
  password_confirmation "vinova"
end