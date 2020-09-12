class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)
    redirect_to root_path
  end

  private
  def review_params
    params.require(:review).permit(:good, :bad).merge(user_id: current_user.id, job_id: params[:job_id])
  end
end
