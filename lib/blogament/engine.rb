module Blogament
  class Engine < ::Rails::Engine
    isolate_namespace Blogament

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
