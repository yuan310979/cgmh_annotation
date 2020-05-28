Rails.application.routes.draw do
    # devise_scope :user do
        # root :to => "devise/sessions#new"
    # end
    root :to => "users#show"
    devise_for :users
    resource :user

    resources :images do
        collection do
            post :import
        end
    end

    resource :quiz do
        collection do
            post :submit
        end
    end

    get "/records/export", to: "records#export"

    resources :records
end
