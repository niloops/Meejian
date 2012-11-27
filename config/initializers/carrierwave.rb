CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = 'leslielilu'
  config.upyun_password = 'g4l4pg2sh13sm'
  config.upyun_bucket = "meejian-photos"
  config.upyun_bucket_domain = "meejian-photos.b0.upaiyun.com"
end
