require 'spec_helper'

describe Interview do
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

      @interview = Fabricate.build(:interview,
                             answers: [Answer.new(question: "whatever",
                                              answer: answer_with_products)])
    end

    specify do
      answer = @interview.answers[0]
      answer.should have(3).ref_products(@host)
      answer.ref_products(@host).should == @products
    end

    specify {@interview.ref_products(@host).should == @products}
  end
end
