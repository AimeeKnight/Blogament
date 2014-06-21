# ### desc "Explaining what the task does"
# task :blogament do
#   ### Task goes here
# end

task "blogament:install" => "blogament:install:migrations" do

  File.open(File.join(Rails.root, "config/initializers/blogament.rb"), "wb") do |io|
    io.write(%{
Rails.application.config.before_initialize do
  Blogament.author_class = "User"
end
    })
  end

end
