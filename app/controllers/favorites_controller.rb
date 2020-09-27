class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    @favorite = current_user.favorites.create(job_id: @job.id)
    # redirect_back(fallback_location: root_path) 
  end
  
  def destroy
    @favorite = current_user.favorites.find_by(job_id: @job.id)
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def set_tweet
    @job = Job.find(params[:job_id])
  end
end
