Rails.application.config.middleware.use OmniAuth::Builder do
  unless ENV["CLIENT_ID"].present? && ENV["CLIENT_SECRET"].present?
   raise "client id and client secret are not set. Please set these variables in order to continue"
  end
  provider :github, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"]
end
