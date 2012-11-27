class Answer
  include Mongoid::Document

  field :question, type: String
  field :answer, type: String
  field :recommend, type: Boolean, default: false

  embedded_in :interview

  after_validation :strip_multi_br

  after_update :recommend_interview

  def ref_products
    return @ref_products if @ref_products
    regexp = Regexp.new "#{Settings.host}/products/([[:alnum:]]+)"
    ids = []
    answer.scan(regexp) { |md| ids << md[0] }
    products = Product.find ids.uniq
    @ref_products = ids.map do |id|
      products.find {|p| p.id.to_s == id}
    end.compact
    @ref_products
  end

  private

  def strip_multi_br
    answer.gsub!(/(<br>\s*)+$/, '<br>') if answer
  end

  def recommend_interview
    interview.update_attribute(:recommend, recommend) if recommend_changed?
  end
end
