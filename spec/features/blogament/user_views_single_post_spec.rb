require 'spec_helper'

feature "User views a single post" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "views an single post show page" do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Title")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
  end
end
