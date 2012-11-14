Fabricator(:interview) do
  author(fabricator: :user)
  topic
  answers(count: 3)  do |attrs, i|
    Fabricate.build(:answer, question: "q-#{i}", answer: "a-#{i}")
  end
end
