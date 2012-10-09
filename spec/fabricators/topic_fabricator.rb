Fabricator(:topic) do
  title "Title"
  desc "Description"
  questions(count: 3) {|attrs, i| "question-#{i}"}
end
