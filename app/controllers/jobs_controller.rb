class JobsController < ApplicationController
  
  def index
    @job = Job.new
    @lists = Job.all.order("created_at DESC")
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

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)
  end


  private

  def job_params
    params.require(:job).permit(:title, :occupation, :image1, :image2, :image3, :description, :salary, :access, :time, :week, :access, :emplyee, :term, :pr1, :pr2, :pr3)
  end

end