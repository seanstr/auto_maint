class Api::V1::AutomobilesController < ApplicationController
  respond_to :json

  def show
    respond_with Automobile.find(params[:id])
  end

  def create
    automobile = Automobile.new(automobile_params) 
    if automobile.save
      render json: automobile, status: 201, location: [:api, automobile] 
    else
      render json: { errors: automobile.errors }, status: 422
    end
  end

  def update
    automobile = Automobile.find(params[:id]) 

    if automobile.update(automobile_params)
      render json: automobile, status: 200, location: [:api, automobile] 
    else
      render json: { errors: automobile.errors }, status: 422
    end
  end

  def destroy
    automobile = Automobile.find(params[:id]) 
    automobile.destroy
    head 204
  end

  private

	def automobile_params
	  params.require(:automobile).permit(:make, :model, :year, :odometer_reading) 
	end
end
