CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIASPFJAJC7YUQXALHV',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
    }

    config.fog_directory  = 'locura-bucket'
    config.cache_storage = :fog
  
end