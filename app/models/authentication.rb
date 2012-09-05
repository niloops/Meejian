class Authentication
  include Mongoid::Document
  include Mongoid::Timestamps
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :image, type: String
  field :url, type: String
  field :current, type: Boolean, default: false
  embedded_in :user

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  class << self
    def from_omniauth(omniauth)
      new provider: omniauth[:provider],
      uid: omniauth[:uid],
      name: omniauth[:info][:name],
      image: omniauth[:info][:image] do |auth|
        extra = auth.provider.to_sym
        auth.send(extra, omniauth) if auth.respond_to?(extra, true)
      end
    end
  end

  private

  def weibo(omniauth)
    self.url = omniauth[:info][:urls][:Weibo]
  end

end
