class CommentsController < ApplicationController
  def show
    @comments = Comment.all_by(params['subreddit_id'], params['id'], current_user)
  end

  def vote
    Comment.vote(params[:comment], params[:format], current_user)
    redirect_to :back
  end
end
