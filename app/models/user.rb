class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String

  embeds_many :authentications
  index({"authentications.provider" => 1, "authentications.uid" => 1})

  DELEGATED_ATTR = [:name, :image, :url]

  class << self
    def create_with_auth(auth)
      create do |user|
        auth.current = true
        user.authentications << auth
      end
    end

    def find_by_auth(auth)
      where("authentications.provider" => auth.provider)
        .and("authentications.uid" => auth.uid).first
    end
  end

  def current_auth
    authentications.where(current: true).first
  end

  def method_missing(name, *args)
    (DELEGATED_ATTR.include? name) ?
    current_auth.send(name, *args) :
      super
  end
end
