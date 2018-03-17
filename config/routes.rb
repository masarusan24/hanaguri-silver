Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :teams, param: :team_short_name
end
