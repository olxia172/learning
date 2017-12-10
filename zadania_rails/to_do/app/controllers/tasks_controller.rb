class TasksController < ApplicationController
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(params[:task].permit(:title, :text))
    redirect_to @task
  end

  def show
    @task = Task.find(params[:id])
  end
end
