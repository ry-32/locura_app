Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :advertiser
  resources :podcaster
  
  get '/podcasters' => 'podcaster#podcaster'
  get '/advertisers' => 'advertiser#advertiser'
  get '/podcaster-contact' => 'podcaster#podcaster_contact'
  
  get '/login' => 'home#login'



  
end
