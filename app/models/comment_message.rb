class CommentMessage < Message
  belongs_to :post

  class << self
    def find_by_post(user, post)
      user.messages.unread.by_type(:comment_message).where(post_id: post.id)
    end

    def read_by_post(user, post)
      find_by_post(user, post).each {|message| message.read!}
    end
  end

  private

  def find_similar
    # In before_create callback, the embedded documents do exist, but not persisted.
    # So here reject that new embedded document, otherwise it'll be find as similar message
    self.class.find_by_post(user, post)
      .reject {|m| m == self}
      .first
  end
end
