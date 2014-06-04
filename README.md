## Blogament

Blogament is a Rails Engine designed to provide its host with a blogging & commenting feature.

## Getting started
Instructions for installing and mounting. (Just thoughts for now.)

Blogament works with Rails 4.1.1 onwards. You can add it to your Gemfile with:

```ruby
gem 'blogament'
```
Run the bundle command to install it.

After you install Blogament and add it to your Gemfile, you need to run the generator:

```console
rails generate blogament:install
```

The generator will install an initializer which describes Blogaments's configuration options.

The generator commes with a blog and comment model by default, along with routes and views.
You can comment out the comment model functionality in the initializer if you prefer to not allow commenting for your blog.

In order for your apps users to 'have many' blogs, you'll need to set your user object (in quotes) as Blogaments author:

```ruby
Rails.application.config.before_initialize do
  Blogament.author_class = "User"
end
```

If you're enabling commenting, you'll need to also configure the model for comments.

You'll then run `rake db:migrate` as the generator will have created a migration file.

Finally, Blogament needs to know who can create posts and who can't.
In order for Blogament to place nice with your current authentication
implementation, you'll need to implment:

```ruby
def admin?
  # responds with true or false
end
```

## Planned Usage

- Posts with title, content, & admin_id
- Posts model hooks into an admin model
- Allow admins to manage blogs (hook into ActiveAdmin, CanCanCan, etc.)
- Comments model which belongs to Posts, has content, post_id, user_id
- WYSIWYG for Blogging (tinyMCE?)
- Allow either Foundation or Bootstrap
- Allow blogs to have images

Extra Credit?
- Allow comments to include user picture via Gravatar 
- Allow admins to approve or deny a comment from a user who isn't signed in

## License

Blogament is released under the [MIT License](http://www.opensource.org/licenses/MIT).
