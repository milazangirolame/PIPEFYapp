Rails.application.routes.draw do
  namespace :api, defaults: { format: :html } do
    namespace :v1 do
      resources :organizations, only: [ :index ]
    end
  end
end
