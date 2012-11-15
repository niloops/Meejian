require 'spec_helper'

describe Interview do
  before do
    @interview = Fabricate.build(:interview)
  end

  context "validates answers" do
    before do
      @interview = Fabricate.build(:interview, answers: [])
      @interview.answers << Answer.new(question: "no answer question", answer: "")
    end

    subject {@interview}

    it {should_not be_valid}
  end

  context "references products in the answer" do
    before do
      @host = "localhost:3000"

      @products = []
      3.times {@products << Fabricate(:product)}

      answer_with_products = @products.map do |p|
        "http://#{@host}/products/#{p.id}"
      end.join('-')

      @interview.answers << Answer.new(question: "whatever",
                                        answer: answer_with_products)
    end

    specify do
      answer = @interview.answers.last
      answer.should have(3).ref_products(@host)
      answer.ref_products(@host).should == @products
    end

    specify {@interview.ref_products(@host).should == @products}
  end

  context "strip br tags at the answer end" do
    before do
      multi_br_end = "hello brs! <br> <br><br>"
      @interview.answers << Fabricate.build(:answer, answer: multi_br_end)
      @interview.save!
      @answer = @interview.answers.last
    end

    subject {@answer}
    its(:answer) {should == "hello brs! <br>"}
  end

  context "liked by users" do
    before do
      @user = Fabricate(:user)
      @user.like! @interview
    end

    subject {@interview}

    it {should be_liked_by(@user)}
    its(:liked_users) {should include(@user)}

    it "should exist in user's like_posts" do
      @user.like_posts.should include(@interview)
    end

    it "should only be liked once" do
      3.times {@user.like! @interview}
      @user.like_posts.count.should == 1
      @interview.liked_users.count.should == 1
      @interview.liked_count.should == 1
    end
  end

end
