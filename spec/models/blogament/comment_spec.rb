require 'spec_helper'

module Blogament
  describe Comment do

    it "has text" do
      comment = Comment.new(text: "Test text")
      expect(comment.text).to eq "Test text"
    end

    it "belongs to a post" do
      comment = Comment.new(text: "Test text")
      expect(comment).to respond_to(:posts)
    end

    it "belongs to an author" do
      post = Post.new(title: "Test Title")
      expect(post).to respond_to(:author)
    end

  end
end
