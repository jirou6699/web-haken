class JobsController < ApplicationController
  def index
    @job = Job.new
    @lists = Job.all
  end

  def new
  end

  def create
    @job = Job.create(job_params)
  end

  def destroy
    list = Job.find(params[:id])
    list.destroy
  end

  private

  def job_params
    params.require(:job).permit(:title, :image1, :description, :salary, :access, :time, :week, :access, :emplyee, :term)
  end

end
