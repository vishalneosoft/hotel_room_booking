Rails.application.routes.draw do
  devise_for :users
  resources :rooms do
    collection do
      post :check_availability
    end
  end
  resources :bookings

  root :to => 'bookings#home'
  get 'home' => "bookings#home"

end
