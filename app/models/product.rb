# -*- coding: utf-8 -*-
class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :shop, type: String, default: ""
  field :price, type: Float
  field :description, type: String, default: ""
  mount_uploader :photo, PhotosUploader

  validates :title, presence: true
  validates :photo, presence: {message: "请上传产品图片"}
  validates :shop, presence: true
  validates :price, presence: true, numericality: { greater_than: -0.01 }
  validates :description, length: { maximum: 1024 }

  belongs_to :creator, class_name: "User", inverse_of: :creation
end
