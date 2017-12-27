class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:title, :release_date, :length, :description, :types, :director, :writer, :country))
    @movie.save
    redirect_to movie_path(@movie)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
