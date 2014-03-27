TweetInformant::Application.routes.draw do




  resources :trends do
    collection do 
      # get :available
      get '/place/:woe_id' => 'trends#place'
      get '/search/:query' => 'trends#search'
    end
  end

  root to: 'pages#home'

end
