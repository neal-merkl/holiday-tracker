Rails.application.routes.draw do

  root            'days#index'
  get '/:date' => 'days#show', as: 'date'

  get '/:holiday/:country/:year' => 'holidays#show'

  get '/holidays/new'            => 'holidays#new'
  post '/holidays/'              => 'holidays#create'
  get 'holidays/:id'             => 'holidays#edit'
  patch 'holidays/:id'           => 'holidays#update'
  delete 'holidays/:id'          => 'holidays#destroy'

end
