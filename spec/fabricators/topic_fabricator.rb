Fabricator(:topic) do
  title { Faker::Lorem.word }
  subtitle "Subtitle"
  description "Description"
  category
  editor
  questions(count: 3) {|attrs, i| "question-#{i}"}
end
