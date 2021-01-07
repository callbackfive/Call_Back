CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV["aws_access_key_id"],
    aws_secret_access_key: ENV["aws_secret_access_key"],
    region:                'us-west-1',
    host:                  's3-us-west-1.amazonaws.com',
  }
  config.fog_directory  = ENV['fog_directory']
end
