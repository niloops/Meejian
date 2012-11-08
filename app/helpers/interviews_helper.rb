# -*- coding: utf-8 -*-
module InterviewsHelper
  def ref_products(answer)
    regexp = Regexp.new "http://#{request.env['HTTP_HOST']}/products/([[:alnum:]-]+)"
    slugs = []
    answer.scan(regexp) { |slug| slugs << slug }
    products = Product.find slugs.uniq
    slugs.map do |slug|
      products.find {|p| p.slugs == slug}
    end.compact
  end

  def ref_products_for_interview(interview)
    interview.answers.reduce([]) do |products, answer|
      products.concat ref_products(answer.answer)
    end.take(5)
  end

  def recommend_control(interview)
    link_to recommend_toggle_topic_interview_path(interview.topic, interview),
    method: :post, class: 'btn btn-warning' do
      interview.recommend? ? "取消推荐" : "推荐"
    end
  end
end
