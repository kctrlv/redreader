class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.subscriptions_by(current_user)
  end

  def show
    # byebug
    @posts = Subreddit.posts(params['id'], current_user)
    @info = Subreddit.about(params['id'], current_user)
  end
end
