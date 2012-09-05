# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do
  before do
    @auth = Fabricate.build :weibo
    @user = User.create_with_auth(@auth)
  end

  subject {@user}

  it {should be_valid}
  its(:name) {should == @auth.name}
  its(:image) {should == @auth.image}
  its(:url) {should == @auth.url}

  context "be found by auth" do
    before do
      @user_found = User.find_by_auth(@auth)
    end

    it {should eq(@user_found)}
  end

  context "be build from weibo" do
    before do
      @weibo_omniauth = {
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
      @user = User.find_or_create_with_omniauth(@weibo_omniauth)
    end

    subject {@user}

    it {should be_valid}
    its(:name) {should eq(@weibo_omniauth[:info][:name])}
    its(:image) {should eq(@weibo_omniauth[:info][:image])}
    its(:url) {should eq(@weibo_omniauth[:info][:urls][:Weibo])}

    it "can be found by weibo omniauth" do
      should eq(User.find_or_create_with_omniauth(@weibo_omniauth))
    end
  end

  context "be found by id and token" do
    before do
      @user_found = User.find_by_id_with_token(@user.id, @user.token)
    end

    it {should eq(@user_found)}
  end
end
