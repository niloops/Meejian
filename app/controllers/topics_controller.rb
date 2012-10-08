# -*- coding: utf-8 -*-
class TopicsController < ApplicationController
  layout "admin"

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      flash[:success] = "话题#{@topic.title}创建成功"
      redirect_to topics_path
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    render 'new'
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      flash[:success] = "话题#{@topic.title}修改成功"
      redirect_to topics_path
    else
      render 'new'
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

  def show
    @topic = Topic.find(params[:id])
  end
end
