CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAISQV3UOZMHLLZXNQ',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'elusive-index'
end