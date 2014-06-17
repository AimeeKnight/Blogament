module Blogament
  class Post < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    acts_as_taggable
    # attr_accessor :author_name

    has_many :comments
    belongs_to :author, class_name: "::#{Blogament.author_class}"
    # belongs_to :author, class_name: Blogament.author_class.to_s
    # belongs_to :author, class_name: "User"
    # before_save :set_author

     # private

    #def set_author
      ### self.author = Blogament.author_class.constantize.find_or_create_by(name: author_name)
      #self.author = Blogament.author_class.find_or_create_by(name: author_name)
    #end
  end
end
