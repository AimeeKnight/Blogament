require 'spec_helper'

describe "User views posts" do
  let!(:post) { FactoryGirl.create(:post) }

  it "views an index page of posts" do
    visit blorgh.root_path
    expect(page).to have_content("Listing posts")
    expect(page).to have_content("Title")
    expect(page).to have_content("Text")
    expect(page).to have_content("I'm a little teapot")
  end
end
