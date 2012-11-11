class Category
  include Mongoid::Document

  field :name, type: String, default: ""

  validates :name, presence: true, uniqueness: true

  has_many :topics, dependent: :restrict
end
