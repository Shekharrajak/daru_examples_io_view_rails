Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sciruby/repos', to: 'sciruby_github#repos'
  get '/sciruby/watchers', to: 'sciruby_github#watchers'
  get '/election/data', to: 'election#data'
  get '/countries', to: 'countries#data_countries'
  get '/', to: 'front_page#home'
end
