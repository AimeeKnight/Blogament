FactoryGirl.define do
  factory :user, aliases: [:author] do
    sequence(:email) { |n| "person_#{n}@example.com"}
  end

  factory :post, class: Blogament::Post do
    title   "Test Title"
    text    "I'm a little teapot"
    author
  end

  factory :comment, class: Blogament::Comment do
    text    "I'm trolling"
  end

end
