Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    AppConfig.settings[:facebook][:key],
    AppConfig.settings[:facebook][:token]
end
