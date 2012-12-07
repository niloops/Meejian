require 'spec_helper'

describe Comment do
  let(:author) {Fabricate(:user)}
  let(:interview) {Fabricate(:interview)}

  before do
    @comment = Comment.new(author: author, content: "comment")
    interview.comments << @comment
  end

  subject {@comment}

  it {should be_valid}
  its(:post) {should == interview}
  specify "post should has the comment" do
    interview.comments.should be_include @comment
  end

  context "send message with comment" do
    subject {interview.author.messages.first}
    its(:post) {should == interview}
  end

  context "mark comment message as read when read post" do
    before {CommentMessage.read_by_post(interview.author, interview)}

    subject {interview.author.messages.first}
    its(:read) {should == true}
  end

  context "merge comment messages from same post" do
    before do
      @author_next = Fabricate(:user)
      @comment_next = Comment.new(author: @author_next,
                              content: "comment_next")
      interview.comments << @comment_next
      @receiver = interview.author
    end

    specify {@receiver.messages.count.should == 1}

    subject {@receiver.messages.first}
    its(:senders) {should be_include author}
    its(:senders) {should be_include @author_next}
  end

  context "not merge messages from different posts" do
    before do
      @author_next = Fabricate(:user)
      @comment_next = Comment.new(author: @author_next,
                              content: "comment_next")
      @receiver = interview.author
      @interview_next = Fabricate(:interview, author: @receiver)
      @interview_next.comments << @comment_next
      @receiver.reload
    end

    specify {@receiver.messages.count.should == 2}
    specify {@receiver.messages.first.senders.should be_include @author_next}
    specify {@receiver.messages.last.senders.should be_include author}
  end
end
