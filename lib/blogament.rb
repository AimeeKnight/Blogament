require "blogament/engine"
require 'jquery-rails'
require 'tinymce-rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'foundation-rails'
require 'pg'
require 'carrierwave'
require 'mini_magick'

module Blogament
  mattr_writer :author_class

  def self.author_class
    @@author_class.constantize
  end
end
