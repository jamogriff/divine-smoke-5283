class GrowingPlantsController < ApplicationController

  def destroy
    growing_plant = GrowingPlant.find(params[:id])
    growing_plant.destroy
    redirect_to plots_path
  end

end
