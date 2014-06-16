
Rails.application.config.before_initialize do
  Blogament.author_class = "User"
end
    