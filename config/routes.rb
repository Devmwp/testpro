Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  post '/upload' => 'home#upload', as: :upload
  get '/play' => 'home#play', as: :play
  post '/store/tick' => 'home#store_tick', as: :store_tick
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
