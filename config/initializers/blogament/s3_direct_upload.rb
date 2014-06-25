S3DirectUpload.config do |c|
  c.access_key_id = ENV['S3_KEY']
  c.secret_access_key = ENV['S3_SECRET']
  c.region = "us-west-2"
  c.bucket = ENV['S3_BUCKET_NAME']
  c.url = "https://amk-nss.s3.amazonaws.com"
end
