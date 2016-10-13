class RedditService
  def self.get(endpoint, user)
    conn = Faraday.new(url: 'https://oauth.reddit.com')
    conn.headers['Authorization'] = "Bearer #{user.token}"

    # TODO: IF 401 response, reauthorize user to reset expired token with session create
    response = conn.get(endpoint)
    if response.status == 401
      # conn = Faraday.new(url: 'https://www.reddit.com')
      # conn.headers['Authorization'] = "Bearer #{user.token}"
      # response = conn.post('/api/v1/access_token',  { grant_type:'refresh_token', refresh_token: user.refresh_token })
      # user.update_token(response['access_token'])
      # byebug

      # user.refresh
      # conn = Faraday.new(url: 'https://oauth.reddit.com')
      # conn.headers['Authorization'] = "Bearer #{user.token}"
      # response = conn.get(endpoint)
      # JSON.parse(response.body, symbolize_names: true)
    else
      # user.refresh
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.subreddits_by(user)
    data = get("/subreddits/mine/subscriber", user)[:data]
    data[:children]
  end

  def self.posts(subreddit, user)
    data = get("/r/#{subreddit}/hot", user)[:data]
    data[:children]
  end

  def self.about(subreddit, user)
    data = get("/r/#{subreddit}/about", user)[:data]
    data
  end

  def self.all_comments(subreddit, post, user)
    get("/r/#{subreddit}/comments/#{post}", user)
  end
end
