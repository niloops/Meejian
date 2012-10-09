require 'spec_helper'

describe Topic do
  before do
    @topic = Fabricate.build :topic
  end

  subject {@topic}

  it {should be_valid}
  it {should have(3).questions}
end
