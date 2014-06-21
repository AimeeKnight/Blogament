require 'spec_helper'

#mock_auth: true
feature "Viewing all posts" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "as a logged in user" do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    expect(page).to have_content("Blogs")
    expect(page).to have_content("Title")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
    expect(page).to have_content("New Post")
  end

  scenario "as a logged out user", mock_auth: { status: :unauthorized } do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(nil)

    visit blogament.root_path
    expect(page).to have_content("Blogs")
    expect(page).to have_content("Title")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
    expect(page).to_not have_content("New Post")
  end
end
