require 'spec_helper'

describe "User views a single post" do
  let!(:post) { FactoryGirl.create(:post) }

  it "views an single post show page" do
    visit blorgh.root_path
    click_link "Show"
    expect(page).to have_content("Author")
    expect(page).to have_content("Title")
    expect(page).to have_content("Text")
    expect(page).to have_content("Comments")
    expect(page).to have_content("New comment")
  end
end
