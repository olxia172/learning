class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(params[:task].permit(:title, :text))
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end
end
