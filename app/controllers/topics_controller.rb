# -*- coding: utf-8 -*-
class TopicsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @topic = Topic.new
    @questions = [""]
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.editor = current_user
    if @topic.save
      flash[:success] = "话题#{@topic.title}创建成功"
      redirect_to @topic
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @questions = @topic.questions
    render 'new'
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      flash[:success] = "话题#{@topic.title}修改成功"
      redirect_to @topic
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @recommended_interviews = @topic.interviews.recommended
    @not_recommended_interviews = @topic.interviews.not_recommended
    if @topic.interviews.count == 1
      redirect_to topic_interview_path(@topic, @topic.interviews.first), flash: { details: true }
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:success] = "话题#{@topic.title}删除成功"
    redirect_to topics_path
  end

  def index
    @topics = Topic.desc(:created_at)
  end
end
