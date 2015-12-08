Rails.application.routes.draw do

  root            'days#index'

  get '/:date' => 'days#show', as: 'date'

  resources :holidays, except: [:show]
  get '/:holiday/:country/:year' => 'holidays#show'

end
