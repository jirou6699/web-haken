class FavoritesController < ApplicationController
  before_action :set_action

  def create
    @favorite = current_user.favorites.create(job_id: params[:job_id])
    @match = Job.find(params[:job_id])
  end
  
  def destroy
    @match = Job.find(params[:job_id])
    @favorite = current_user.favorites.find_by(job_id: @match.id)
    @favorite.destroy
  end

  private

  def set_action
    @job = Job.find(params[:job_id])
  end

end
