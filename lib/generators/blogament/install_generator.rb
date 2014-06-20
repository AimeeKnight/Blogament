module Blogament
  class InstallGenerator < Rails::Generators::Base
    def install
      route 'mount Blogament::Engine, at: "/blog"'
      rake 'blogament:install'
    end
  end
end
