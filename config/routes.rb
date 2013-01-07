ReaderDemo::Application.routes.draw do
  resources :annotations
  resources :documents


  namespace :v1 do
    get '/documents', to: 'api#show_documents'
    get '/documents/:document_id', to: 'api#show_document'
    get '/documents/:document_id/annotations', to: 'api#show_annotations'

  end

end
