Rails.application.routes.draw do
  root :to => 'api/v1/organizations#index'
  namespace :api, defaults: { format: :html } do
    namespace :v1 do
      resources :organizations, only: [ :index ]

    end
  end

  get 'create_or_update_records', to: 'api/v1/organizations#create_or_update_records'
  get 'delete_data', to: 'api/v1/organizations#delete_records'

end
