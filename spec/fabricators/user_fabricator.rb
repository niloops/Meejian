Fabricator(:user) do
  email { Faker::Internet.email }
  name  { Faker::Name.name.truncate(10) }
  password "123456"
end

Fabricator(:editor, from: :user) do
  admin true
end
