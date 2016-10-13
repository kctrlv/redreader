Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['api_key'], ENV['api_secret'], {:scope => 'identity,mysubreddits', :duration => 'permanent'}
end
