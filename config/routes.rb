require 'api_constraints'

AutoMaintenanceApi::Application.routes.draw do

  #Api definition
  namespace :api, :defaults => {:format => :json} do
    scope module: :v1,
        constraints: ApiConstraints.new(version: 1, default: true) do
      [:gasoline, :diesel, :electrical].each do |auto_type|
        resources auto_type, controller: :automobiles, type: auto_type, only: [:index, :show, :create, :update, :destroy, :options] do
        	resources :tasks, only: [:index, :create, :destroy, :options]
        end
      end
      resources :maintenance_tasks, only: [:index, :show, :create, :update, :destroy, :options]
    end
  end
end
