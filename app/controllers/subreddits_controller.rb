class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.subscriptions_by(current_user)
  end
end
