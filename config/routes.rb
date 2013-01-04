ReaderDemo::Application.routes.draw do
  resources :annotations
  resources :documents


  namespace :v1 do
    get '/documents', to: 'api#show_documents'
  end

end
