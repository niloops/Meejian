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

  describe "be found by auth" do
    before do
      @user_found = User.find_by_auth(@auth)
    end

    it "is the user created by auth" do
      @user_found.should eq(@user)
    end
  end

end
