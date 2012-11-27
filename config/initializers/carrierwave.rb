CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = Settings.upyun.username
  config.upyun_password = Settings.upyun.password
  config.upyun_bucket = Settings.upyun.photo_bucket
  config.upyun_bucket_domain = Settings.upyun.photo_bucket_domain
end
