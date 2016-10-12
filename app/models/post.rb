class Post
  attr_reader :title,
              :url,
              :permalink,
              :author,
              :subreddit,
              :score,
              :num_comments,
              :nsfw

  def initialize(raw_data)
    @title = raw_data[:title]
    @url = raw_data[:url]
    @permalink = raw_data[:permalink]
    @author = raw_data[:author]
    @subreddit = raw_data[:subreddit]
    @score = raw_data[:score]
    @num_comments = raw_data[:num_comments]
    @nsfw = raw_data[:over_18]
  end
end
