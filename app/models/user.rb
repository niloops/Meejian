class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable,
  :rememberable, :trackable, :validatable

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :name,               type: String, default: ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates :name, presence: true, length: {minimum: 2, maximum: 10}

  attr_protected :encrypted_password

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## User info
  field :job, type: String, default: ""
  field :interests, type: String, default: ""
  field :location, type: String, default: ""
  field :description, type: String, default: ""

  mount_uploader :avatar, PhotosUploader

  ## Relations
  has_many :creations, class_name: "Product", inverse_of: :creator
  has_many :editable_topics, class_name: "Topic", inverse_of: :editor
  has_many :posts, class_name: "Post", inverse_of: :author
end
