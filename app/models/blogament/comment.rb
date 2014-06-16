module Blogament
  class Comment < ActiveRecord::Base
    belongs_to :posts
  end
end
