class RedditService
  def self.get(endpoint, user)
    conn = Faraday.new(url: 'https://oauth.reddit.com')
    conn.headers['Authorization'] = "Bearer #{user.token}"
    response = conn.get(endpoint)
    if response.status == 401
      user.refresh
      get(endpoint, user)
    else
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
