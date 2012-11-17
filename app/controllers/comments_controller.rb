class CommentsController < ApplicationController
  before_filter :setup_interview
  load_and_authorize_resource

  def create
    @comment = Comment.new params[:comment].merge(author: current_user)
    @interview.comments << @comment
    respond_to do |format|
      format.html do
        redirect_to topic_interview_path(@topic, @interview)
      end
      format.js
    end
  end

  def destroy
    comment = @interview.comments.find params[:id]
    @comment_id = comment.id
    comment.destroy
    respond_to do |format|
      format.html do
        redirect_to topic_interview_path(@topic, @interview)
      end
      format.js
    end
  end

  private

  def setup_interview
    @topic = Topic.find params[:topic_id]
    @interview = Interview.find params[:interview_id]
  end
end
