class CropsController < ApplicationController
  def destroy
    crop = Crop.find_by(plot_id: params[:plot_id], plant_id: params[:plant_id])
    crop.destroy
    redirect_to plots_path
  end
end
