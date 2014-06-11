require 'spec_helper'

feature "User views posts" do
  let!(:post) { FactoryGirl.create(:post) }

  scenario "views an index page of posts" do
    visit blogament.root_path
    expect(page).to have_content("Listing posts")
    expect(page).to have_content("Title")
    expect(page).to have_content("Text")
    expect(page).to have_content("I'm a little teapot")
  end
end
