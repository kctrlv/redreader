class CommentsController < ApplicationController
  def index
    @comments = Comment.all_by(params['subreddit'], params['post'], current_user)
  end
end
