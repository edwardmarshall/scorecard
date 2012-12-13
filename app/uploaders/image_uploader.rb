# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
    "fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :display do
    process :resize_to_fill => [400, 320]
  end

  version :thumb do
    process :resize_to_fill => [250, 200]
  end

  version :icon do
    process :resize_to_fill => [100, 80]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{model.kind.gsub(" ", "_")}_photo" if original_filename
  end

  # def mogrify(options = {})
  #   manipulate! do |img|
  #     img.format("png") do |c|
  #       c.push        '+profile'
  #       c.+           "!xmp,*"
  #       c.profile     "#{Rails.root}/lib/color_profiles/sRGB_v4_ICC_preference_displayclass.icc"
  #       c.colorspace  "sRGB"
  #     end
  #     img
  #   end
  # end


end
