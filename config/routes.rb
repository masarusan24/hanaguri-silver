Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :teams, param: :team_short_name
  resources :contacts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
