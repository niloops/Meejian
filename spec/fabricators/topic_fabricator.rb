Fabricator(:topic) do
  title "Title"
  subtitle "Subtitle"
  description "Description"
  questions(count: 3) {|attrs, i| "question-#{i}"}
end
