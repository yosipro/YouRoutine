CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIATCB62TP7MMJGBSNS',
    :aws_secret_access_key  => 'RyNr3GmgppQQazr2ta+ZNaueCpFkb/mga+XWkeQ/',
    :region                 => 'us-east-1'
  }

  config.fog_directory = 'your_backet' if Rails.env.production?
  config.fog_directory = 'your_backet_for_dev' if Rails.env.development?

end