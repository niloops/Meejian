class Answer
  include Mongoid::Document

  field :question, type: String
  field :answer, type: String

  embedded_in :interview

  def ref_products(host)
    domain = ActionDispatch::Http::URL.extract_domain host
    regexp = Regexp.new "#{domain}/products/([[:alnum:]]+)"
    ids = []
    answer.scan(regexp) { |md| ids << md[0] }
    products = Product.find ids.uniq
    ids.map do |id|
      products.find {|p| p.id.to_s == id}
    end.compact
  end
end
