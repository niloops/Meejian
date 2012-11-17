# -*- coding: utf-8 -*-
class InterviewsController < ApplicationController
  before_filter :setup_topic
  before_filter :authenticate_user!, only: [:new, :create]
  load_and_authorize_resource

  def new
    unless @can_create_interview
      flash[:info] = "您已经参与过#{@topic.title}, 请编辑您的回答"
      redirect_to edit_topic_interview_path(@topic, @interview)
    else
      @can_create_interview = false
      @interview = Interview.new
      setup_answers
    end
  end

  def create
    @interview = Interview.new params[:interview]
      .merge(author: current_user, topic: @topic)
    if @interview.save
      flash[:success] = "您回答了对#{@topic.title}的访谈"
      redirect_to topic_interview_path(@topic, @interview)
    else
      flash.now[:error] = @interview.errors.full_messages.first
      setup_answers
      render 'new'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
    render 'new'
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update_attributes(params[:interview])
      flash[:success] = "您修改了对#{@topic.title}的访谈"
      redirect_to topic_interview_path(@topic, @interview)
    else
      flash.now[:error] = @interview.errors.full_messages.first
      render 'new'
    end
  end

  def show
    @interview = Interview.find(params[:id])
    @author = @interview.author
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    flash[:success] = "您对#{@topic.title}的访谈删除成功"
    redirect_to @topic
  end

  def like
    @interview = Interview.find(params[:id])
    current_user.like! @interview
    respond_to do |format|
      format.html do
        flash[:success] = "您已经顶了这篇访谈"
        redirect_to topic_interview_path(@topic, @interview)
      end
      format.js
    end
  end

  def recommend_toggle
    @interview = Interview.find(params[:id])
    @interview.recommend = !@interview.recommend
    @interview.save
    flash[:success] = @interview.recommend? ? "您推荐了此访谈" : "您取消了对此访谈的推荐"
    redirect_to topic_interview_path(@topic, @interview)
  end

  private

  def setup_topic
    @topic = Topic.find(params[:topic_id])
    @can_create_interview = !Interview.find_by_topic_and_author(@topic, current_user)
  end

  def setup_answers
    @interview.answers = @topic.questions.map do |q|
      Answer.new question: q, answer: ""
    end
  end
end
