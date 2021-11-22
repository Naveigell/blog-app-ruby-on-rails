Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get('/', to: 'home/home#index')
  get('/:slug', to: 'user/post#show')
end
