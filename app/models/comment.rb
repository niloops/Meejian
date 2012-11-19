class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String

  embedded_in :post
  belongs_to :author, class_name: 'User'

  validates :content, presence: true

  after_create :add_post_author_karma

  private

  def add_post_author_karma
    post.author.karma_add(10)
  end
end
