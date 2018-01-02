class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy] # metoda z application_controller
  before_action :require_admin, only: [:edit, :update, :destroy] # metoda z application_controller

  def index
    @movies = Movie.all.order(created_at: :desc)
    @movies = Movie.where("title like :searched_title", searched_title: "%#{params[:search].capitalize!}%") if params[:search].present?
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie), notice: 'You successfully added new movie'
    else
      #Rails.logger.info @movie.errors.full_messages.join(', ')
      flash.now.alert = 'Something went wrong. Try again'
      render 'new'
    end
  end

  def show
    @opinion = Opinion.new
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'You successfully updated this movie'
    else
      #Rails.logger.info @movie.errors.full_messages.join(', ')
      flash.now.alert = 'Something went wrong. Try again'
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: 'You successfully deleted a movie'
  end

private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :length, :description, :types, :director, :writer, :country, :image)
  end
end
