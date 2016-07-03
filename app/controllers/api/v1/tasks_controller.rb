class Api::V1::TasksController < ApplicationController
  respond_to :json

  # return all maintenance tasks that are valid for the fuel_mode, 
  # adding a "selected=true|false" field so that the UI can offer a full list to the user
  def index
    begin
      @automobile = auto_table.select(:id, :make, :model, :year, :odometer_reading, :fuel_mode).find(lookup_id)
      tasks = @automobile.maintenance_tasks
      maint_tasks = MaintenanceTask.select(:id, :name, :description, 
            :suitable_for_gasoline, :suitable_for_diesel, :suitable_for_electrical)
        .where("suitable_for_#{maintenance_task_field}" => true).all

      task_id_array = tasks.pluck(:id)
      task_array = []
      maint_tasks.each do |mt|
        hsh = mt.serializable_hash
        hsh.merge!({selected: true}) if task_id_array.include?(mt.id)
        hsh.merge!({selected: false}) unless task_id_array.include?(mt.id)
        task_array << hsh
      end
      render json: { params[:type].to_s => @automobile, tasks: task_array }
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end 

  def create
    begin
      #expect a json array consisting of automobile_id, maintenance_task_id
      tasks = params[:maintenance_tasks]
      automobile = auto_table.find(lookup_id)

      #add any tasks not yet associated to the automobile
      auto_tasks = automobile.maintenance_tasks
      task_id_array = auto_tasks.pluck(:id)
      tasks.each do |t|
        automobile.maintenance_tasks << MaintenanceTask.find(t) unless task_id_array.include?(t)
      end
      automobile.save
      render json: automobile, status: 201, location: api_gasoline_tasks_url(lookup_id) #{ controller: :gasoline, action: :show, id: lookup_id } 
        #api_automobile_url(automobile)
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end

  def destroy
    begin
      automobile = auto_table.find(lookup_id) 
      task = automobile.maintenance_tasks.find(params[:id])
      automobile.maintenance_tasks.delete(params[:id]) if task

      head 204
    rescue Exception => e
      puts "error"
      puts e
      render json: { errors: e.message }, status: 422
    end
  end

  private

  def maintenance_task_field
    @automobile.fuel_mode.downcase
  end

  def lookup_id
    auto_id = params[:gasoline_id] || params[:diesel_id] || params[:electrical_id]
  end

  def auto_table
    params[:type].to_s.titleize.constantize
  end

end