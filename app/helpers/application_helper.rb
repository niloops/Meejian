# -*- coding: utf-8 -*-
module ApplicationHelper
  def page_title(title)
    title.blank? ? "" : " | #{title}"
  end
end
