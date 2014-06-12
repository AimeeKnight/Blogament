require 'spec_helper'

feature "User creates a post" do
  scenario "a logged in user created a post", :js do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    expect(page).to have_content("New post")
    fill_in 'Title', :with => 'Test Title'
    attach_file "Image", '/Users/aimeeknight/Desktop/NSS-Ruby/blogament/spec/data/skating.jpg'
    page.execute_script('$("#tinymce4").tinymce().setContent("Test Text from TinyMCE.")')
    click_button 'Create Post'
    expect(current_path).to eq blogament.posts_path
    expect(page).to have_content "Test Title"
    expect(page).to have_content "Test Text from TinyMCE."
  end
end
