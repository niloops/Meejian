Fabricator(:user) do
  email "lilu.life@gmail.com"
  name  "lilu"
  password "123456"
end

Fabricator(:editor, from: :user) do
  admin true
end
