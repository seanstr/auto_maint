class Api::V1::MaintenanceTasksController < ApplicationController
  respond_to :json

  def index
    respond_with MaintenanceTask.all
  end 

  def show
    respond_with MaintenanceTask.find(params[:id])
  end

  def create
    maintenance_task = MaintenanceTask.new(maintenance_task_params) 
    if maintenance_task.save
      render json: maintenance_task, status: 201, location: [:api, maintenance_task] 
    else
      render json: { errors: maintenance_task.errors }, status: 422
    end
  end

  def update
    maintenance_task = MaintenanceTask.find(params[:id]) 

    if maintenance_task.update(maintenance_task_params)
      render json: maintenance_task, status: 200, location: [:api, maintenance_task] 
    else
      render json: { errors: maintenance_task.errors }, status: 422
    end
  end

  def destroy
    maintenance_task = MaintenanceTask.find(params[:id]) 
    maintenance_task.destroy
    head 204
  end

  private

	def maintenance_task_params
	  params.require(:maintenance_task).permit(:name, :description, 
      :suitable_for_gasoline, :suitable_for_diesel, :suitable_for_electrical) 
	end

end
