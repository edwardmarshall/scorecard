Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    AppConfig.settings[:facebook][:key],
    AppConfig.settings[:facebook][:token]
  provider :twitter,
    AppConfig.settings[:twitter][:key],
    AppConfig.settings[:twitter][:token]
end
