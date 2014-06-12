require 'spec_helper'

feature "User creates a post" do

  scenario "a logged in user created a post" do
    user = User.new(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    expect(page).to have_content("New post")
    fill_in 'Title', :with => 'Test Title'
    attach_file "Image", "spec/data/skating.jpg"
    click_button 'Create Post'
    expect(current_path).to eq blogament.posts_path
    expect(page).to have_content "Test Title"
    expect(page.find('img')['src']).to have_content '/thumb_skating.jpg'
  end
end
