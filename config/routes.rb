EveAlert::Application.routes.draw do
  match 'user' => 'user#index', :as => :home
  resources :accounts do
      resources :characters
  end

  resources :events

  match '/' => 'welcome#index'
end
