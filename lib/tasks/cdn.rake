namespace :assets do
  desc 'Upload assets to cdns'
  task :upload_to_cdn => :environment do
    ftp = FtpSync.new "v0.ftp.upyun.com",
    [Settings.upyun.username, Settings.upyun.assets_bucket].join("/"),
    Settings.upyun.password, verbose: true, passive: true
    ftp.push_dir "#{Rails.root}/public/assets", "assets"
  end
end
