class MatchesController < ApplicationController
  def index
    @matches = Job.all
  end

  def show
  end
end
