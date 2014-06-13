require 'spec_helper'

feature "User edits a post" do
  scenario "a logged in user edits a post", :js do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    expect(page).to have_content("New post")
    fill_in 'Title', :with => 'Test Title'
    page.execute_script('$("#tinymce4").tinymce().setContent("Test Text from TinyMCE.")')
    click_button 'Create Post'
    expect(current_path).to eq blogament.posts_path
    expect(page).to have_content "Test Title"
    expect(page).to have_content "Test Text from TinyMCE."

    click_link "Full Post"
    expect(page).to have_content("Test Text from TinyMCE")
    click_link "Edit"
    expect(page).to have_content("Edit")
    fill_in 'Title', :with => 'Test Title Edit'
    attach_file "Image", '/Users/aimeeknight/Desktop/NSS-Ruby/blogament/spec/data/skating.jpg'
    page.execute_script('$("#tinymce4").tinymce().setContent("Test Edit Text from TinyMCE.")')
    click_button 'Update Post'
    expect(current_path).to eq blogament.posts_path
    expect(page).to have_content "Test Title Edit"
    expect(page).to have_content "Test Edit Text from TinyMCE."
  end

  scenario "a logged in user tries to edit a post they didn't create" do
    user = User.create!(email: 'aimee@example.com')
    create(:post)
    set_current_user(user)

    visit blogament.root_path
    click_link "Full Post"
    expect(page).to_not have_content("Edit")
  end
end
