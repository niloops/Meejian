class InvitedInfo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :info, type: String
  validates_presence_of :info
end
