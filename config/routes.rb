require 'api_constraints'

AutoMaintenanceApi::Application.routes.draw do
  #Api definition
  namespace :api do
    scope module: :v1,
        constraints: ApiConstraints.new(version: 1, default: true) do
      resources :automobiles, only: [:index, :show, :create, :update, :destroy] do
      	resources :tasks, only: [:index, :create, :destroy]
      end
      resources :maintenance_tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
