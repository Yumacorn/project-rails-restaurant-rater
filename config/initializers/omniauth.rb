Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :google, CONSUMER_KEY, CONSUMER_SECRET
    # provider :google, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
    provider :developer unless Rails.env.production?

    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], skip_jwt: true
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  end