FactoryGirl.define do
  factory :author, class: User do
    sequence(:email) { |n| "person_#{n}@example.com"}
    # password "1231kjhkjh23"
    # password_confirmation { "1231kjhkjh23" }
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
