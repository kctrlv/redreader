class RedditService
  def self.get(endpoint, user)
    conn = Faraday.new(url: 'https://oauth.reddit.com')
    conn.headers['Authorization'] = "Bearer #{user.token}"
    # TODO: IF 401 response, reauthorize user to reset expired token with session create
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.subreddits_by(user)
    data = get("/subreddits/mine/subscriber", user)
    data[:children]
  end
end
