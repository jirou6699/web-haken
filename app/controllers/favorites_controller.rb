class FavoritesController < ApplicationController
  before_action :job_item

  def create
    @favorite = current_user.favorites.create(job_id: params[:job_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @favorite = current_user.favorites.find_by(job_id: @job.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def job_item
    @job = Job.find(params[:job_id])
  end
end
