class MatchesController < ApplicationController
  
  def index
    @matches = Job.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def show
    @match = Job.find(params[:id])
    @review = Review.new
    @reviews = @match.reviews.includes(:user)
  end

  def search
    @matches = Job.search(params[:keyword])
    @matches = @matches.page(params[:page])
  end
end
