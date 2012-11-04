class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :recommend, type: Boolean, default: false

  belongs_to :author, class_name: "User", inverse_of: :post
end
