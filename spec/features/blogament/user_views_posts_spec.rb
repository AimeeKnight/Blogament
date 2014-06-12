require 'spec_helper'

feature "User views posts" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "views an index page of posts" do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    expect(page).to have_content("Blogs")
    expect(page).to have_content("Title")
    expect(page).to have_content("I'm a little teapot")
  end
end
