Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate',   to: 'authentication#authenticate'
  post '/user/create',   to: 'users#create'
  post '/note/create',   to: 'notes#create'
  get  '/notes',         to: 'notes#index'
  post '/note/share',    to: 'notes#share'
end
