module Blogament
  class Comment < ActiveRecord::Base
    belongs_to :posts
    belongs_to :author, class_name: "::#{Blogament.author_class}"

    def author_gravatar_url
      stripped_email = self.author.email.strip
      downcased_email = stripped_email.downcase
      hash = Digest::MD5.hexdigest(downcased_email)
      "http://gravatar.com/avatar/#{hash}"
    end

  end
end
