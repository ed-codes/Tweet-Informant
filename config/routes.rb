TweetInformant::Application.routes.draw do




  resources :trends do
    collection do 
      # get :available
      get '/place/:woe_id' => 'trends#place'
    end
  end

  root to: 'pages#home'

end
