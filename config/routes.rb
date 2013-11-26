Jsonapi::Application.routes.draw do
  
  scope :api do
    resources :users, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'users#index', on: :collection
      
      resources :articles, except: [ :show, :new, :edit ], defaults: { format: :json } do
        get ':id' => 'articles#index', on: :collection
      end

      resources :comments, except: [ :show, :new, :edit ], defaults: { format: :json } do
        get ':id' => 'comments#index', on: :collection
      end
    end

    resources :articles, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'articles#index', on: :collection
      
      resources :comments, except: [ :show, :new, :edit ], defaults: { format: :json } do
        get ':id' => 'comments#index', on: :collection
      end
    end

    resources :comments, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'comments#index', on: :collection
    end
  end
  
  root 'site#index'
end
