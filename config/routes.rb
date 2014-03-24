TweetInformant::Application.routes.draw do

  resources :trends do
    collection do 
      get :available
      get '/place/:place_id' => 'trends#place'
    end
  end

end
