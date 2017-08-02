Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sciruby/repos', to: 'sciruby_github#repo'
end
