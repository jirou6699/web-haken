class MatchesController < ApplicationController
  
  def index
    @matches = Job.all.order("created_at DESC").page(params[:page]).per(3)
  end

  def show
    @match = Job.find(params[:id])
    @review = Review.new
    @reviews = @match.reviews.includes(:user)
  end

  def search
    @matches = Job.search(params[:keyword])
  end
end
