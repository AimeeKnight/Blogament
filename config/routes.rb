Blogament::Engine.routes.draw do
  get "/tags/:tag", to: "posts#index", as: :tag

  root to: "posts#index"

  resources :posts do
    resources :comments
  end

end
