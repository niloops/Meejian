class Auth
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  embedded_in :user

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  class << self
    def from_omniauth(data)
      new provider: data[:provider], uid: data[:uid], name: data[:info][:name]
    end
  end

  def url
    url_method = "#{provider}_url".to_sym
    send url_method if respond_to? url_method
  end

  def weibo_url
    "http://weibo.com/u/#{uid}"
  end
end
