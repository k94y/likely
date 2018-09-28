class AudioFileUploader < CarrierWave::Uploader::Base
  # 追記
  include CarrierWave::Audio

  # 追記
  version :mp3 do
    process :convert => [{output_format: :mp3}]

    def full_filename(for_file)
      "#{super.chomp(File.extname(super))}.mp3"
    end
  end
end
