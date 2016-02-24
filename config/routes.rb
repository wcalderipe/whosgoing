Rails.application.routes.draw do
  root 'home#index'
  get 'events/:fb_id', to: 'events#index'
end
