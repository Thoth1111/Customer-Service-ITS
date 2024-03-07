require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
    cloud_name: ENV['CLOUDINARY_NAME'],
    api_key:   ENV['CLOUDINARY_API_KEY'],
    api_secret: ENV['CLOUDINARY_API_SECRET'],
)

Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
    store: Shrine::Storage::Cloudinary.new(prefix: "ITS_avatars"),
}

Shrine.plugin :activerecord # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers # provides file validations
Shrine.plugin :validation # provides validation helpers