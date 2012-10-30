# -*- coding: utf-8 -*-
module ApplicationHelper
  def brand
    "觅见"
  end

  def slogan
    "与真实的品位相遇"
  end

  def page_title(title)
    title.blank? ? "" : " | #{title}"
  end

  def alert(alert=:alert)
    content_tag :div, class: alert do
      button_tag('x', type: 'button', class: 'close',
             'data-dismiss' => alert) + flash[alert]
    end if flash[alert]
  end
end
