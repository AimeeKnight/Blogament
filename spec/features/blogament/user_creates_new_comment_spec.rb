require 'spec_helper'

feature "Creating a comment" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "as logged in user", mock_auth: true do
    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    fill_in "Text", :with => "Test Comment"
    click_button "Create Comment"
    expect(current_path).to eq blogament.post_path(post)
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    expect(page).to have_content("Test Comment")
    expect(page).to have_content("Your comment's been added.")
  end
  scenario "as a logged out user", mock_auth: { status: :unauthorized } do
    visit blogament.root_path
    click_link "Full Post"
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    fill_in "Text", :with => "Test Comment"
    click_button "Create Comment"
    expect(current_path).to eq blogament.post_path(post)
    expect(page).to have_content("Comments")
    expect(page).to have_content("New Comment")
    expect(page).to have_content("Test Comment")
    expect(page).to have_content("Your comment's been added.")
  end
end
