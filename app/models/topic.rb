class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :desc, type: String
  field :questions, type: Array, default: []

  slug :title

  validates :title, presence: true, uniqueness: true
  validates :desc, presence: true
end
