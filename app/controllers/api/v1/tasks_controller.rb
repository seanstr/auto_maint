class Api::V1::TasksController < ApplicationController
  respond_to :json

  # return all valid maintenance tasks
  def index
    begin
      @automobile = Automobile.find(params[:automobile_id])
      tasks = @automobile.maintenance_tasks
      maint_tasks = MaintenanceTask.where("suitable_for_#{maintenance_task_field}" => true).all
      if tasks.empty?
        task_array = maint_tasks.to_a.map(&:serializable_hash)
      else
        # add "selected" to any tasks already associated with the automobile
        task_id_array = tasks.pluck(:id)
        task_array = []
        maint_tasks.each do |mt|
          hsh = mt.serializable_hash
          hsh.merge!({selected: true}) if task_id_array.include?(mt.id)
          task_array << hsh
        end
      end
      render json: { automobile: @automobile, tasks: task_array }
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end 

  def create
    begin
      #expect a json array consisting of automobile_id, maintenance_task_id
      tasks = params[:maintenance_tasks]
      automobile = Automobile.find(params[:automobile_id])

      #add any tasks not yet associated to the automobile
      auto_tasks = automobile.maintenance_tasks
      task_id_array = auto_tasks.pluck(:id)
      tasks.each do |t|
        automobile.maintenance_tasks << MaintenanceTask.find(t[:maintenance_task_id]) unless task_id_array.include?(t[:maintenance_task_id])
      end
      automobile.save
      render json: automobile, status: 201, location: api_automobile_url(automobile)
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end

  def destroy
    begin
      automobile = Automobile.find(params[:id]) 
      automobile.maintenance_tasks.destroy
      automobile.maintenance_tasks.each { |rec| rec.delete }
      head 204
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end

  private

  def maintenance_task_field
    @automobile.fuel_mode.downcase
  end

end