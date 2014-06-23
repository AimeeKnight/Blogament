require 'spec_helper'

feature "Searching posts" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "as a logged in user" do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    fill_in 'Title', :with => 'Test Title'
    fill_in 'post[tag_list]', :with => 'Ruby'
    click_button 'Create Post'
    expect(current_path).to eq blogament.posts_path
    expect(page).to have_content "Test Title"
    expect(page).to have_content "Ruby"

    visit blogament.root_path
    click_link "Ruby"
    expect(page).to have_content("Blogs")
    expect(page).to have_content("Title")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("Ruby")
  end

  scenario "as a logged out user", mock_auth: { status: :unauthorized } do
    user = User.create!(email: 'aimee@example.com')
    set_current_user(nil)

    visit blogament.root_path
    fill_in "query", :with => "little"
    click_button "Search"
    expect(page).to have_content("Blogs")
    expect(page).to have_content("Title")
    expect(page).to have_content("Test Title")
    expect(page).to have_content("I'm a little teapot")
    expect(page).to_not have_content("New Post")
  end
end
