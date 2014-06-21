module Blogament
  class Comment < ActiveRecord::Base
    belongs_to :posts
    belongs_to :author, class_name: "::#{Blogament.author_class}"
  end
end
