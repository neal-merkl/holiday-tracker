Rails.application.routes.draw do

  root 'days#index'
  get '/:date' => 'days#show'

end
