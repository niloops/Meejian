module ProductsHelper
  def product_photo_tag(product, version = nil, options = {})
    link = (version == :huge) ? product.photo_url : product_path(product)
    link_to link do
      image_tag product.photo_url(version), options
    end
  end
end
