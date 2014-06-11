require 'spec_helper'

module Blogament
  describe Post do

    it "has a title" do
      post = Post.new(title: "Test Title")
      expect(post.title).to eq "Test Title"
    end

    it "has many comments" do
      post = Post.new(title: "Test Title")
      expect(post).to respond_to(:comments)
    end

    it "belongs to an author" do
      post = Post.new(title: "Test Title")
      expect(post).to respond_to(:author)
    end

  end
end
