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
end
