Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sciruby/repos', to: 'sciruby_github#repo'
  get '/sciruby/watchers', to: 'sciruby_github#watchers'
  get '/share_market/stocks', to: 'share_market#stocks'
  get '/', to: 'front_page#home'
end
