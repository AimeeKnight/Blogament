## Blogament

Blogament is a Rails Engine designed to provide its host with a blogging & commenting feature.

## Technologies/Dependencies
- RSpec
- Caybara
- TinyMCE
- Foundation
- PostgresSQL

## Getting started
Instructions for installing and mounting. (Just thoughts for now.)

Blogament works with Rails 4 onwards. You can add it to your Gemfile with:

```ruby
gem 'blogament'
```
Run the bundle command to install it.

After you install Blogament and add it to your Gemfile, you need to run the generator:

```console
rails generate blogament:install
```

The generator will install an initializer which describes Blogaments's configuration options.

The generator commes with blog and comment model by default, along with routes and views. You can comment out the comment model functionality
in the initializer if you prefer to not allow commenting for your blog.

Next up in the initializer, you need to configure the user who's id will be used for the blogs admin_id foreign key.
If you're enabling commenting, you'll need to also configure the model for comments.

Finally, you'll run `rake db:migrate` as the generator will have created a migration file.

## Models

Blogament needs to know who can create posts and who can't. In order for Blogament to place nice with your current authentication
implementation, you'll need to implment:

```ruby
def admin?
  # responds with true or false
end
```
## Views


## Usage

- Posts with title, content, & admin_id
- Posts model hooks into an admin model
- Allow admins to manage blogs (hook into ActiveAdmin or CanCanCan vs user implementing admin? getter)
- Comments model which belongs to Posts, has content, post_id, user_id
- WYSIWYG for Blogging (tinyMCE?)
- Allow users to show picture via Gravatar 
- Allow blogs to have images
- Backbone?

## License

Blogament is released under the [MIT License](http://www.opensource.org/licenses/MIT).
