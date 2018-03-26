Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'admin_menu', to: 'users#admin'
  resources :teams, param: :team_short_name
  resources :members, param: :name do
    collection do
      post :confirm
    end
  end
  resources :contacts
  resources :users, param: :name
  resources :sessions, only: %i[new create destroy]
  resources :game_records
  resources :batting_records
  resources :pitching_records
  resources :game_relations, only: %i[create destroy]
  resources :position_relations, only: %i[create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
