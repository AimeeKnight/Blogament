## Blogament

Blogament is a Rails Engine designed to provide its host with a blogging & commenting feature.

## Technologies/Dependencies
RSpec
Caybara
TinyMCE
Foundation
PostgresSQL

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

The generator will install an initializer which describes Blogaments's configuration options... please take a look.
When you're done, you are ready to add a Blogament blog model using the generator:

```console
rails generate blogament blog
```

This will create your blog model. Next, you'll usually run `rake db:migrate` as the generator will have created a migration file.

If you also want to allow commenting for all users you can use the following generator:

```console
rails generate blogament comment
```

This will create your comment model. Again, you'll usually run `rake db:migrate` as the generator will have created a migration file.

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

NSS Chronicles is released under the [MIT License](http://www.opensource.org/licenses/MIT).
