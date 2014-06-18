require "blogament/engine"
require 'jquery-rails'
require 'tinymce-rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'pg'
require 'carrierwave'
require 'mini_magick'
require 'fog'
require 'bootswatch-rails'
require 'acts-as-taggable-on'
require 'jquery-ui-rails'

module Blogament
  mattr_writer :author_class

  def self.author_class
    @@author_class.constantize
  end
end
