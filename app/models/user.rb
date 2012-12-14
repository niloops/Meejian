class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable, :omniauthable,
  :rememberable, :trackable, :validatable

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :name,               type: String, default: ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates :name, presence: true, length: {minimum: 2, maximum: 10}

  attr_protected :encrypted_password, :admin

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Admin role
  field :admin,  type: Boolean, default: false

  ## User info
  field :job, type: String, default: ""
  field :interests, type: String, default: ""
  field :location, type: String, default: ""
  field :description, type: String, default: ""
  mount_uploader :avatar, PhotosUploader

  ## Omniauthable
  embeds_many :auths

  class << self
    def find_by_omniauth(data)
      where("auths.provider" => data[:provider])
        .and("auths.uid" => data[:uid]).first
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.omniauth"]
          user.merge_from_omniauth! data
        end
      end
    end
  end

  def merge_from_omniauth!(data)
    auths << Auth.from_omniauth(data)
    self.name = data[:info][:name]
    self.location = data[:info][:location]
    self.description = data[:info][:description]
    self.remote_avatar_url = data[:info][:image]
  end

  ## Messageable
  embeds_many :messages

  def send_message(receivers, message)
    message.senders << self
    receivers.each do |receiver|
      receiver.messages << message
    end
  end

  ## Likeable
  has_and_belongs_to_many :like_posts, class_name: "Post", inverse_of: :liked_user

  def like!(post)
    like_posts << post
    post.update_attributes(liked_count: post.liked_users.count)
  end

  ## User Karma
  field :karma, type: Integer, default: 0

  def karma_add(num)
    update_attribute(:karma, karma+num)
  end

  ## Posts
  has_many :posts, class_name: "Post", inverse_of: :author
  def interviews
    posts.where('_type' => 'Interview')
  end

  ## Topics
  has_many :editable_topics, class_name: "Topic", inverse_of: :editor

  ## Products
  has_many :creations, class_name: "Product", inverse_of: :creator

  ## Paginates
  paginates_per 12
end
