Rails.application.routes.draw do
  get 'wsdl', to: 'wsdl_test#wsdl'
  post 'actions', to: 'wsdl_test#actions'
end
