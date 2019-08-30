Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/admin', to: redirect('admin/albums'), as: :admin  
  # get 'search/album/tags', to: 'albums#set_search', as: :tags_search
  # delete 'logout' => 'sessions#destroy'
  as :user do
    patch '/users/sign_in', to: 'users/sessions#create'
  end
  namespace :admin do
    authenticate :user do
    resources :albums do
      resources :tags
      member do
        delete :remove_image

      # collection do
        # match 'search' => 'albums#search' , via: [:get,:post], as: :search
      # end   
      end  
    end
  end
end
end

