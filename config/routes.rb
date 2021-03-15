Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate',         to: 'authentication#authenticate'
  post '/user/create',         to: 'users#create'
  post '/note/create',         to: 'notes#create'
  get  '/notes',               to: 'notes#index'
  post '/note/share',          to: 'notes#share'
  post '/note/unshare',        to: 'notes#unshare'
  get  '/note/show',           to: 'notes#show'
  put  '/note/edit',           to: 'notes#edit'
  delete  '/note/destroy',     to: 'notes#destroy'
end
