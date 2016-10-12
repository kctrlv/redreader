module SpecHelpers
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new({
      provider: 'reddit',
      uid: '12345',
      extra: {
        raw_info: {
          name: "cool_guy",
          link_karma: "1500",
          comment_karma: "2500"
        }
      },
      credentials: {
        token: "pizza",
      }
    })
  end
end
