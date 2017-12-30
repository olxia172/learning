class OpinionsController < ApplicationController
  before_action :find_movie

  def index
    redirect_to movie_path(@movie)
  end

  def create
    @opinion = Opinion.new(movie_id: @movie.id)
    @opinion.attributes = opinion_params
    if @opinion.save
      redirect_to movie_path(@movie), notice: 'You successfully added comment'
    else
      flash.now.alert = 'Something went wrong. Try again'
      render 'movies/show'
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to movie_path(@movie), notice: 'You successfully deleted an opinion'
  end

private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def opinion_params
    params.require(:opinion).permit(:author, :rate, :body)
  end
end
