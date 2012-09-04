require 'spec_helper'

describe Authentication do
  context "build from weibo" do
    before do
      @auth = Authentication.new(provider: 'weibo', uid: 'uid', name: 'lilu')
    end

    subject {@auth}
    it {should be_valid}
  end
end
