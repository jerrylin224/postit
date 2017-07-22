PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: :destroy do
    resources :categories, only: [:new, :show, :create, :update]
  end
end
