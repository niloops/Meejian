require 'spec_helper'

describe User do
  before do
    @user = Fabricate.build(:user)
  end

  context "update photo by remote url" do
    before do
      @user.remote_avatar_url = "http://tp1.sinaimg.cn/1218520492/180/5631634610/1.jpg"
      @user.save
    end

    subject {@user}

    its(:avatar) {should_not be_blank}
  end
end
