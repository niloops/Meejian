class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :read, type: Boolean, default: false

  embedded_in :user
  has_and_belongs_to_many :senders, class_name: "User", inverse_of: nil

  default_scope desc(:created_at)

  scope :unread, where(read: false)

  scope :by_type, ->(type) do
    type ? where(_type: type.to_s.camelize) : scoped
  end

  before_create :merge_similar
  after_create :rotate

  def read!
    update_attributes read: true
  end

  private

  def find_similar
  end

  def merge_similar
    message_similar = find_similar
    if message_similar
      self.senders += message_similar.senders
      self.senders.uniq!
      message_similar.destroy
    end
  end

  def rotate
    if user.messages.length > Settings.messages.length
      user.reload.messages.last.delete
    end
  end
end
