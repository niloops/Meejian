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

  def notification_content(message, type)
    content_tag :div, class: "alert alert-#{type}" do
      button_tag('x', type: 'button', class: 'close',
             'data-dismiss' => 'alert') + message
    end
  end

  def notification
    [:error, :alert, :notice, :info, :success].each do |type|
      message = flash.now[type] || flash[type]
      return notification_content(message, type) if message
    end
    nil
  end

  def nav_tab(tab, options = {})
    options[:class] = 'active' if content_for(:nav_tab) == tab
    content_tag(:li, options) {yield}
  end

  def edit_control(path)
    link_to path, class: 'btn btn-info' do
      content_tag(:i, '', class: 'icon-pencil') + " 编辑"
    end
  end

  def destroy_control(path)
    link_to path, class: 'btn btn-danger',
    method: :delete, confirm: "真的要删除吗?" do
      content_tag(:i, '', class: 'icon-trash') + " 删除"
    end
  end
end
