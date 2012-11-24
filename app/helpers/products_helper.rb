# -*- coding: utf-8 -*-
module ProductsHelper
  def product_photo_tag(product, version = nil, options = {})
    link = options.delete :link
    link ||= (version == :huge) ? product.photo_url : product_path(product)
    options.merge! alt: product.title
    link_to link, title: product.title  do
      image_tag product.photo_url(version), options
    end
  end

  def edit_product_control(product)
    if can? :update, product
      edit_control edit_product_path(product)
    end
  end

  def destroy_product_control(product)
    if can? :destroy, product
      destroy_control product
    end
  end

  def purchase_control(product)
    link_to product.shop, class: 'btn btn-success' do
      content_tag(:i, '', class: 'icon-plane') + "访问来源"
    end
  end
end
