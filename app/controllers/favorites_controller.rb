class FavoritesController < ApplicationController
  before_action :set_post

  def create
    @favorite = user_signed_in? && current_user.favorites.create(job_id: params[:job_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @job = Job.find(params[:job_id])
    @favorite = user_signed_in? && current_user.favorites.find_by(job_id: @job.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_post
    @Job = Job.find(params[:job_id])
  end
end
