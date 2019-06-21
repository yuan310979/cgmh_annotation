Rails.application.routes.draw do
    # devise_scope :user do
        # root :to => "devise/sessions#new"
    # end
    root :to => "images#index"
    devise_for :users

    resources :images do
        collection do
            post :import
        end
    end
end
