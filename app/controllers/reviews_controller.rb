class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    respond_to do |format|
      format.html { redirect_to "/matches/#{@review.job_id}.reviews" }
      format.json
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id], job_id: params[:job_id])
    respond_to do |format|
      if @review.present?
        @review.destroy
        format.html { redirect_to "/matches/#{@review.job_id}.reviews" }
        format.json { render json: { id: params[:id], job_id: params[:job_id]} }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:good, :bad).merge(user_id: current_user.id, job_id: params[:job_id])
  end
end
