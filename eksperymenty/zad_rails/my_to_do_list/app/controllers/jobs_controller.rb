class JobsController < ApplicationController
  def index
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params.require(:job).permit(:title))
  end
end
