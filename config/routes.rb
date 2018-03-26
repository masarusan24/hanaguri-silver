Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :teams, param: :team_short_name
  resources :members, param: :name do
    collection do
      post :confirm
    end
  end
  resources :contacts
  resources :users, param: :name
  resources :sessions, only: %i[new create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
