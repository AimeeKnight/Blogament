require 'spec_helper'

describe "User creates a post" do
  let!(:post) { FactoryGirl.create(:post) }

  it "views an index page of posts" do
    user = User.new(email: 'aimee@gmail.com')
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"
    expect(page).to have_content("New post")
  end
end
