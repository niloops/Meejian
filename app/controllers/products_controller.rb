# -*- coding: utf-8 -*-
class ProductsController < ApplicationController
  load_and_authorize_resource

  def new
    @product = Product.new
    render layout: !request.xhr?
  end

  def create
    @product = Product.new(params[:product])
    @product.creator = current_user
    if @product.save
      flash[:success] = "产品#{@product.title}创建成功"
      redirect_to product_path(@product)
    else
      render 'new', layout: !request.xhr?
    end
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
end
