# -*- coding: utf-8 -*-
class ProductsController < ApplicationController
  # TODO authenticate except show
  before_filter :authenticate_user!
  before_filter :authenticate_author, only: [:edit, :update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.creator = current_user
    if @product.save
      flash[:success] = "产品#{@product.title}创建成功"
      redirect_to product_path(@product)
    else
      render 'new'
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

  private

  def authenticate_author
    @product = Product.find params[:id]
    redirect_to(root_path) unless @product.creator == current_user
  end
end
