require 'spec_helper'

feature "User creates a post" do

  scenario "a logged in user created a post" do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
    user = User.new(email: 'aimee@example.com', id: 1)
    set_current_user(user)

    visit blogament.root_path
    click_link "New Post"

    expect(page).to have_content("New post")
    fill_in "Title", with: "Title Input"
    page.execute_script('$("#tinymce4").tinymce().setContent("I am a little teapot.")')
    #fill_in "Text", with: "I'm a little teapot"
    attach_file "Image", 'spec/data/skating.jpg'
    click_button "Create Post"
    page.should have_content "Listing Posts"
    current_path.should == posts_path
    #page.should have_content "I'm a little teapot"
    page.find('img')['src'].should have_content '/skating.jpg'
  end
end
