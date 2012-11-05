class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :shop, type: String
  field :price, type: Float
  mount_uploader :photo, PhotosUploader

  attr_accessible :title, :price, :shop, :photo

  slug :title

  validates :title, presence: true, uniqueness: true
  validates :shop, presence: true
  validates :photo, presence: true
  validates :price, presence: true, numericality: { greater_than: -0.01 }

  belongs_to :creator, class_name: "User", inverse_of: :creation
end
