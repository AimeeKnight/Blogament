require 'spec_helper'

feature "Viewing a single post's show page", :js do

  scenario "as a logged in user who created that post" do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    fill_in 'Title', :with => 'Test Title'
    page.execute_script('$("#tinymce4").tinymce().setContent("Test Text from TinyMCE.")')
    click_button 'Create Post'

    click_link "Full Post"
    expect(page).to have_content("Title")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("Test Text from TinyMCE.")
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    expect(page).to have_content("Edit")
  end
  scenario "that the logged in user didn't create" do
    user = User.create!(email: 'aimee@example.com')
    create(:post)
    set_current_user(user)

    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
    expect(page).to_not have_content("Edit")
  end
  scenario "as a logged out user" do
    create(:post)
    set_current_user(nil)

    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
    expect(page).to_not have_content("Edit")
  end
end
