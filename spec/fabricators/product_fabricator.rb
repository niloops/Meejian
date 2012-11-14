Fabricator(:product) do
  title { Faker::Name.name }
  shop  "somewhere"
  price 1
  description "something random"
  photo do
    fixture = Rails.root.join("spec/fixtures/example.png")
    ActionDispatch::Http::UploadedFile.new(
      tempfile: File.new(fixture),
      filename: File.basename(File.new(fixture))
    )
  end
end
