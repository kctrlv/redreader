class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.subscriptions_by(current_user)
  end

  def show
    @posts = Subreddit.posts(params['subreddit'], current_user)
  end
end
