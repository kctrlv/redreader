class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.screen_name        = auth_info.extra.raw_info.name
      new_user.link_karma         = auth_info.extra.raw_info.link_karma
      new_user.comment_karma      = auth_info.extra.raw_info.comment_karma

      new_user.token              = auth_info.credentials.token
      new_user.refresh_token      = auth_info.credentials.refresh_token
      new_user.created_at         = auth_info.extra.raw_info.created_utc
    end
    user.update_token(auth_info.credentials.token)
    return user
  end

  def update_token(new_token)
    self.token = new_token
    self.save
  end

  def refresh
    conn = Faraday.new(url: 'https://www.reddit.com')
    # res = conn.post ('/api/v1/access_token') do |req|
    #   req.headers['Authorization'] = "Bearer #{self.token}"
    #   req.body = "{ \"grant_type\": \"refresh_token\", \"refresh_token\": \"#{self.refresh_token}\" }"
    # end
    conn.headers['Authorization'] = "Bearer #{self.token}"

    response = conn.post('/api/v1/access_token', {
      grant_type:    'refresh_token',
      refresh_token: self.refresh_token })
    # byebug
    # response = conn.post('/api/v1/access_token',  { grant_type: 'refresh_token', refresh_token: self.refresh_token })
    update_token(response['access_token'])
  end
end
