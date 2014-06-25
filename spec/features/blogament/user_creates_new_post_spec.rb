require 'spec_helper'

feature "Creating a post" do
  scenario "as logged in user", :js do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    expect(page).to have_content("New post")
    fill_in 'Title', :with => 'Test Title'
    attach_file "file", Rails.root.join("app/assets/images/skating.jpg")
    page.execute_script('$("#tinymce4").tinymce().setContent("Test Text from TinyMCE.")')
    click_button 'Create Post'
    expect(current_path).to eq blogament.posts_path
    expect(page).to have_content "Test Title"
    expect(page).to have_content "Test Text from TinyMCE."
    expect(page).to have_content("Your blog post's been published.")
  end
  scenario "as a logged out user" do
    create(:post)
    set_current_user(nil)

    visit blogament.root_path
    expect(page).to_not have_content("New Post")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
  end
end
