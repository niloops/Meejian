# -*- coding: utf-8 -*-
module ApplicationHelper
  def page_title(title)
    title.blank? ? "" : " | #{title}"
  end

  def slogan
    "发现真正的品位"
  end
end
