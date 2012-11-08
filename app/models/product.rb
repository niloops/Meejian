class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :shop, type: String
  field :price, type: Float
  field :description, type: String
  mount_uploader :photo, PhotosUploader

  slug :title

  validates :title, presence: true, uniqueness: true
  validates :shop, presence: true
  validates :photo, presence: true
  validates :price, presence: true, numericality: { greater_than: -0.01 }
  validates :description, length: { maximum: 1024 }

  belongs_to :creator, class_name: "User", inverse_of: :creation
end
