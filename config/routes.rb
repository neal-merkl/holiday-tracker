Rails.application.routes.draw do

  root 'days#index'
  get 'days/:id' => 'days#show'


end
