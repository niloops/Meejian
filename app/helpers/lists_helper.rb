module ListsHelper
  def editor?
    params.has_key? :self
  end
end
