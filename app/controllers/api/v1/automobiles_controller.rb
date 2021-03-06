class Api::V1::AutomobilesController < ApplicationController
  respond_to :json

  def index
    begin
      respond_with auto_table.select(:id, :fuel_mode, :make, :model, :year, :odometer_reading).all
    rescue Exception => e
      render json: { errors: e.message }, status: 404
    end
  end 

  def show
    begin
      respond_with auto_table.select(:id, :fuel_mode, :make, :model, :year, :odometer_reading).find(params[:id])
    rescue Exception => e
      render json: { errors: e.message }, status: 404
    end
  end

  def create
    begin
      # insert a new record via the fuel_type subclass
      automobile = auto_table.new(automobile_params)

      if automobile.save
        render json: automobile, status: 201
      else
        render json: { errors: automobile.errors }, status: 422
      end
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end

  def update
    begin
      automobile = auto_table.find(params[:id]) 

      if automobile.update(automobile_params)
        render json: automobile, status: 200
      else
        render json: { errors: automobile.errors }, status: 422
      end
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end

  def destroy
    begin
      automobile = auto_table.find(params[:id]) 
      automobile.destroy
      head 204
    rescue Exception => e
      render json: { errors: e.message }, status: 422
    end
  end

  private

	def automobile_params
	  params.require(:automobile).permit(:fuel_mode, :make, :model, :year, :odometer_reading) 
	end

  def auto_table
    params[:type].to_s.titleize.constantize
  end
end

