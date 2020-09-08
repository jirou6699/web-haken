class JobsController < ApplicationController
  def index
    @job = Job.new
  end

  def new
  end

  def create
    @job = Job.create(job_params)
  end

  private

  def job_params
    params.require(:job).permit(:title, :image, :description, :salary, :access, :time, :week, :access, :emplyee, :term)
  end

end
