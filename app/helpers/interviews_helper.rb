module InterviewsHelper
  def ref_products(answer)
    regexp = Regexp.new "http://#{request.env['HTTP_HOST']}/products/([[:alnum:]-]+)"
    product_ids = []
    answer.scan(regexp) { |pid| product_ids << pid }
    Product.find product_ids
  end

  def ref_products_for_interview(interview)
    interview.answers.reduce([]) do |products, answer|
      products.concat ref_products(answer.answer)
    end.take(5)
  end
end
