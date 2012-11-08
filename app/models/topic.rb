class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String, default: ""
  field :subtitle, type: String, default: ""
  field :description, type: String, default: ""
  field :questions, type: Array, default: []
  field :interactive, type: Boolean, default: true

  slug :title

  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true

  belongs_to :category
  belongs_to :editor, class_name: "User", inverse_of: :editable_topic

  has_many :interviews

  before_validation { questions.reject! {|i| i.blank?} }
end
