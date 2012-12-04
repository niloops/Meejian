# -*- coding: utf-8 -*-
module TopicsHelper
  def take_recommends(topic)
    recommends = topic.interviews.recommended.take(4)
    if recommends.count < 4
      recommends.take(2)
    else
      recommends
    end
  end
end
