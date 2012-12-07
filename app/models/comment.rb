class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String

  embedded_in :post
  belongs_to :author, class_name: 'User'

  validates :content, presence: true

  after_create :add_post_author_karma, :notify_related_users

  private

  def add_post_author_karma
    post.author.karma_add(10)
  end

  def related_users
    post.comments.map(&:author)
      .push(post.author)
      .reject {|user| user == author}
      .uniq
  end

  def notify_related_users
    author.send_message related_users, CommentMessage.new(post: post)
  end

end
