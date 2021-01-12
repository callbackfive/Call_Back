class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
    0..1.megabytes
  end

  private
  def check_size!(new_file)
    size = new_file.size
    expected_size_range = size_range
    if expected_size_range.is_a?(::Range)
      if size < expected_size_range.min
        raise CarrierWave::IntegrityError, I18n.translate(:"errors.messages.min_size_error", :min_size => ApplicationController.helpers.number_to_human_size(expected_size_range.min))
      elsif size > expected_size_range.max
        raise CarrierWave::IntegrityError, I18n.translate(:"errors.messages.max_size_error", :max_size => ApplicationController.helpers.number_to_human_size(expected_size_range.max))
      end
    end
  end

end
