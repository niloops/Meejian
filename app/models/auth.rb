class Auth
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  embedded_in :user

  attr_accessible
  validates :provider, presence: true
  validates :uid, presence: true
end
