# -*- coding: utf-8 -*-
require 'spec_helper'

describe Authentication do
  context "build from weibo" do
    before do
      weibo_test_double = {
        provider: "weibo",
        uid: 1218520492,
        info: {
          name: "_李路",
          image: "http://tp1.sinaimg.cn/1218520492/50/5631634610/1",
          urls: {
            Weibo: "http://weibo.com/coocooba"
          }
        }
      }
      @auth = Authentication.from_omniauth(weibo_test_double)
    end

    subject {@auth}
    it {should be_valid}
    its(:provider) {should == "weibo"}
    its(:uid) {should == "1218520492"}
    its(:name) {should == "_李路"}
    its(:image) {should == "http://tp1.sinaimg.cn/1218520492/50/5631634610/1"}
    its(:url) {should == "http://weibo.com/coocooba"}
  end
end
