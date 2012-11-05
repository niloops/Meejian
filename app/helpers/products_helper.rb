module ProductsHelper
  def product_photo_tag(product, version = nil, options = {})
    link = (version == :huge) ? product.photo_url : product_path(product)
    options.merge! alt: product.title
    link_to link, title: product.title  do
      image_tag product.photo_url(version), options
    end
  end
end
