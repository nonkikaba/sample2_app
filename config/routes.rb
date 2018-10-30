Rails.application.routes.draw do
  root 'static_pages#home'
  #=> root_path -> '/'
  get  '/help',    to: 'static_pages#help'
  #=> help_path -> '/help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
end
