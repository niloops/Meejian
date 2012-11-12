require 'spec_helper'

describe Topic do

  context "rejects the blank questions" do
    before do
      @topic = Fabricate(:topic) do
        questions ["q1", "q2", ""]
      end
    end

    subject {@topic}

    it {should be_valid}
    it {should have(2).questions}
  end

end
