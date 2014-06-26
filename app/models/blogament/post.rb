module Blogament
  class Post < ActiveRecord::Base
    searchkick autocomplete: ['title']
    mount_uploader :image, ImageUploader
    process_in_background :image
    acts_as_taggable

    has_many :comments
    belongs_to :author, class_name: "::#{Blogament.author_class}"
  end
end
