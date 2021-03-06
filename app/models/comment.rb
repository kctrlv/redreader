class Comment
  attr_reader :name, :author, :body, :score, :children
  def initialize(raw_data)
    @name   = raw_data[:name]
    @author = raw_data[:author]
    @body   = raw_data[:body]
    @score  = raw_data[:score]
    @children = raw_data[:replies][:data][:children].map{ |child| Comment.new(child[:data]) } if raw_data[:replies].class == Hash
  end

  def self.all_by(subreddit, post_id, user)
    raw_comments = RedditService.all_comments(subreddit, post_id, user)[1][:data][:children]
    raw_comments.map{ |raw_comment| Comment.new(raw_comment[:data]) }
  end

  def self.vote(comment, dir, user)
    RedditService.comment_vote(comment, dir, user)
  end
end
