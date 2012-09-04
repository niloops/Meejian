class Authentication
  include Mongoid::Document
  include Mongoid::Timestamps
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :image_url, type: String
  field :link_url, type: String
  field :current, type: Boolean, default: false

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
end
