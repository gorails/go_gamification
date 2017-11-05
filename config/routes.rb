Rails.application.routes.draw do
  namespace :gamification do
    resources :levels
    resources :items
    resources :item_types
    resources :inventories
    resources :item_groups
  end
end
