Rails.application.routes.draw do
  resources :owners
  resources :articles

  get '/:name', to: 'owners#show', :as => 'owner_page'
  get '/:name/articles', to: 'articles#index', :as => 'owner_articles'
  root to: 'site_pages#home'
end
