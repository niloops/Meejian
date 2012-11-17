class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :recommend, type: Boolean, default: false
  field :liked_count, type: Integer, default: 0

  embeds_many :comments
  belongs_to :author, class_name: "User", inverse_of: :post
  has_and_belongs_to_many :liked_users, class_name: "User", inverse_of: :like_post

  def liked_by?(user)
    liked_users.find user
  end
end
