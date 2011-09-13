Rails.application.routes.draw do
  namespace :manage do
    resources :locales
  end
end
