TweetInformant::Application.routes.draw do

  root to: 'trends#index'

  resources :trends do
    collection do 
      get :available
      get '/place/:place_id' => 'trends#place'
    end
  end

end
