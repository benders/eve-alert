EveAlert::Application.routes.draw do
  match 'user/:action/:id' => 'user#index', :as => :home
  resources :accounts do
      resources :characters
  end

  match '/' => 'welcome#index'
end
