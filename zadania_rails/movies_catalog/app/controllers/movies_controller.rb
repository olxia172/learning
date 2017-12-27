class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:title, :release_date, :length, :description, :types, :director, :writer, :country))
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :length, :description, :types, :director, :writer, :country)
  end
end
