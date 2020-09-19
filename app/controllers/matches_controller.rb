class MatchesController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
    @matches = Job.all.order("created_at DESC")
  end

  def show
    @match = Job.find(params[:id])
    @review = Review.new
    @reviews = @match.reviews.includes(:user)
  end

  def search
    @matches = Job.search(params[:keyword])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
