class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String

  attr_accessible :email
end
