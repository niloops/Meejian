module ProductsHelper
  def product_photo_tag(product, version = nil, options = {})
    image_tag product.photo_url(version), options
  end
end
