# -*- coding: utf-8 -*-
class ProductsController < ApplicationController
  load_and_authorize_resource
  layout :get_layout

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.creator = current_user
    render 'new' unless @product.save
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    render 'new'
  end

  def update
    if @product.update_attributes(params[:product])
      flash[:success] = "产品#{@product.title}修改成功"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    flash[:success] = "您对#{@product.title}删除成功"
    @product.destroy
    redirect_to root_path
  end

  private

  def get_layout
    request.xhr? ? nil : 'application'
  end
end
