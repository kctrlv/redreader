class CommentsController < ApplicationController
  def show
    @comments = Comment.all_by(params['subreddit_id'], params['id'], current_user)
  end
end
