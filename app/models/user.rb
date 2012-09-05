class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :token, type: String
  field :email, type: String

  embeds_many :authentications
  index({"authentications.provider" => 1, "authentications.uid" => 1})

  DELEGATED_ATTR = [:name, :image, :url]

  before_create :create_token

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

    def find_or_create_with_omniauth(omniauth)
      auth = Authentication.from_omniauth(omniauth)
      return nil unless auth && auth.valid?
      find_by_auth(auth) || create_with_auth(auth)
    end

    def find_by_id_with_token(id, token)
      user = find(id)
      (user && user.token == token) ? user : nil
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

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64 if new_record?
  end
end
