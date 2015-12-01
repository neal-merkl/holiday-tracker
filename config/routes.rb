Rails.application.routes.draw do

  root 'days#index'
  get 'days/:date' => 'days#show'

end
