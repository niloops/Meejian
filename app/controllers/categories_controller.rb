# -*- coding: utf-8 -*-
class CategoriesController < ApplicationController
  load_and_authorize_resource

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "分类\"#{@category.name}\"创建成功"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    render 'new'
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "分类\"#{@category.name}\"修改成功"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "分类\"#{@category.name}\"删除成功"
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end
end
