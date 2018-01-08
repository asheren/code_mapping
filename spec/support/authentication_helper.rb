module AuthenticationHelper
  def sign_in
    visit "/auth/github"
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper, type: :feature
end
