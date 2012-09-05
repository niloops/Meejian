# -*- coding: utf-8 -*-
Fabricator(:weibo, from: :authentication) do
  provider "weibo"
  uid "uid"
  name "foobar"
  image "http://fakeimage.com/fakeimage"
  url "http://weibo.com/fakeurl"
end
