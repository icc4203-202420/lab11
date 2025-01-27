Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :rooms, only: [:index, :show, :create] do
          resources :messages, only: [:index, :create]
        end
        resources :users, only: [:index, :show, :create]
        resources :messages, only: [:show, :update, :destroy]
        resources :room_presences, only: [:create, :destroy]
        resources :votes, only: [:index, :create]        
      end
    end
  end
end
