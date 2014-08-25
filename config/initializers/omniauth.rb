Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, '4522529', '7ikEynnVOvre0LPsModQ'
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :twitter, 'APP_ID', 'APP_SECRET'
end