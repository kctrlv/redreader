class Subreddit
  attr_reader :title, :description, :url

  def initialize(raw_data)
    @title = raw_data[:display_name]
    @description = raw_data[:public_description]
    @url = raw_data[:url]
  end

  def self.subscriptions_by(user)
    raw_subreddits = RedditService.subreddits_by(user)
    raw_subreddits.map{ |raw_data| Subreddit.new(raw_data[:data]) }
  end

  def self.posts(subreddit, user)
    raw_posts = RedditService.posts(subreddit, user)
    raw_posts.map{ |raw_post| Post.new(raw_post[:data]) }[0..14]
  end

  def self.about(subreddit, user)
    raw_about = RedditService.about(subreddit, user)
    SubredditInfo.new(raw_about)
  end

  def self.rules(subreddit, user)
    # raw_rules = RedditService.rules(subreddit, user)[:data]
  end

end
