require 'spec_helper'

describe Message do
  let(:sender) {Fabricate(:user)}
  let(:receiver) {Fabricate(:user)}

  before do
    @message = Message.new(content: "message")
    sender.send_message [receiver], @message
  end

  context "message send success" do
    subject {receiver.messages.first}

    its(:senders) {should be_include sender}
    its(:content) {should == "message"}
    its(:read) {should == false}

    specify "receiver got only one message" do
      receiver.messages.length.should == 1
    end
  end

  context "read message" do
    before {@message.read!}
    subject {@message}
    its(:read) {should == true}
  end

  context "messages has maximum length" do
    before do
      Settings.messages.length.times do |i|
        sender = Fabricate(:user)
        message = Message.new(content: "message-#{i}")
        sender.send_message [receiver], message
      end
    end

    subject {receiver.messages}
    its(:length) {should == Settings.messages.length}
    it {should_not be_include @message}
  end
end
