# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :upyun
  # storage :fog

  self.upyun_bucket = "meejian-user-avatar"
  self.upyun_bucket_domain = "meejian-user-avatar.b0.upaiyun.com"

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    image_path([mounted_as, version_name, "default.png"].compact.join('_'))
  end

  # Override url method to implement with "Image Space"

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    # current_path 是 Carrierwave 上传过程临时创建的一个文件，有时间标记，所以它将是唯一的
    @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
    "#{@name}.#{file.extension.downcase}"
  end

end
