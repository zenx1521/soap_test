Rails.application.routes.draw do
  wash_out :rumbas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'wsdl', to: 'wsdl_test#wsdl'
  post 'actions', to: 'wsdl_test#actions'
end
