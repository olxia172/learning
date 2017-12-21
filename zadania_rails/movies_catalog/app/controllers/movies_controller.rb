class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @article = Article.new(params.require(:movie).permit(:title, :release_date,
      :length, :description, :types, :director, :writer, :country))
    @article.save
  end
end
