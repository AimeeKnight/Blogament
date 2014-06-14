## Blogament
![Image](/blogament.png?raw=true)

Blogament is a Rails Engine designed to provide its host with blogging and commenting features.

## Getting started
Instructions for installing and mounting.

#### Installing Blogament
Blogament works with Rails 4.1.1 onwards. You can add it to your Gemfile with:

```ruby
gem 'blogament', :git => 'git://github.com/AimeeKnight/Blogament.git'
```
Run the `bundle` command to install it.

To make your app Blogament's functionality, you need to mount the engine inside you app in `routes.rb` as follows:

```ruby
mount Blogament::Engine, at: "/blog"
```

After adding Blogament to your Gemfile and mounting it within your app, you need to copy over Blogament's migrations:

```console
rake blogament:install:migrations
```
Once the migrations have been copied over, you need to run `rake db:migrate` as usual.

#### Configuration
Next, you need to create a configuration initializer `config\initializers\blogament.rb`
to describes Blogament's configuration options.
In order for your app's users to 'have many' blogs and comments, you'll need to set your 
user object (as a string) as Blogaments author class:

```ruby
Rails.application.config.before_initialize do
  Blogament.author_class = "User"
end
```
Finally, Blogament needs to know who can create posts and who can't.
In order for Blogament to place nice with your current authentication
implementation, you'll need to impelment the following on you user model:

```ruby
def can_blog?
  # responds with true or false
end
```
In addition, Blogament assumes your sessions will have a `current user` object.
If you don't have this currently, it will need to be implemented.

#### Rails Console
Posts and comments need to be accessed via their namespace.
For example:

```console
Blogament::Post.find(1)
```

#### Views

Blogs listed on the index and show page will display a 'by line' which
identifies the blogs author. It's up to you to tell blogament what you'd like the by line to display.
In order to do so, you'll also need to implement the following in your model:

```ruby
def by_line
  #you may want to return the the models name, or maybe their email.
end
```

Blogament's views can be customized as well. For instance, in order to customize the layout for
the posts index page you can create a file at `app/views/blogament/posts/index.html.erb`,
and it will be used in place of the default view provided.

#### Deployment and S3 Image Upload with Heroku

Blogament is designed to be used in conjunction with Carrierwave, Fog,
and Amazon S3. While Blogament takes care of the ImageUploader class and all 
necessary dependencies (no need to add anything besed blogament to your Gemfile), 
it's up to you to configure Carrierwave by creating a file at 
`/config/initializers/carrierwave.rb`. 
The configuration has worked beautifully
for me when deploying to Heroku, and using the Figaro
gem to store my environment variables.

```ruby
 CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  elsif Rails.env.development?
    config.storage = :file
    config.enable_processing = true
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['S3_KEY'],                # required
      :aws_secret_access_key  => ENV['S3_SECRET'],             # required
    }
    config.fog_directory      = ENV['S3_BUCKET_NAME']          # required
  end
end
```

## License

Blogament is released under the [MIT License](http://www.opensource.org/licenses/MIT).
