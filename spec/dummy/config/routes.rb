Rails.application.routes.draw do
  mount Blogament::Engine => "/blog"
  root to: "posts#index"
end
