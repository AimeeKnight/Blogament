require 'spec_helper'

feature "Creating a comment" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "as logged in user", :js do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    fill_in "Text", :with => "Test Comment"
    click_button "Create Comment"
    expect(current_path).to eq blogament.post_path(post)
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    expect(page).to have_content "Test Comment"
  end
  scenario "as a logged out user" do
    set_current_user(nil)

    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    fill_in "Text", :with => "Test Comment"
    click_button "Create Comment"
    expect(current_path).to eq blogament.post_path(post)
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    expect(page).to have_content "Test Comment"
  end
end
