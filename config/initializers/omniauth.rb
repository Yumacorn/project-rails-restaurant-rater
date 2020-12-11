Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :google, CONSUMER_KEY, CONSUMER_SECRET
    # provider :google, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']

    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
  end