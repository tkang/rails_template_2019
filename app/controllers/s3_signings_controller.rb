class S3SigningsController < ApplicationController
  def index
    object_name = params[:objectName]
    key = "uploads/#{SecureRandom.uuid}_#{object_name}"
    render json: { signedUrl: get_signed_url(key)}
  end

  private

  def get_signed_url(s3_key)
    storage = fog_storage
    options = { path_style: true }
    hdrs = {"Content-Type" => params[:contentType], "x-amz-acl" => "public-read"}
    storage.put_object_url(Settings.s3_bucket_name,
                           s3_key,
                           15.minutes.from_now.to_time.to_i,
                           hdrs,
                           options)
  end

  def fog_storage
    Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'] || Settings.aws_access_key_id,
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || Settings.aws_secret_access_key,
    )
  end

end
