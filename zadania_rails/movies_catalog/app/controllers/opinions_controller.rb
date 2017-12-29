class OpinionsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @opinion = Opinion.new(movie_id: @movie.id)
    @opinion.attributes = opinion_params
    if @opinion.save
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to movie_path(@movie)
  end

private

  def opinion_params
    params.require(:opinion).permit(:author, :rate, :body)
  end
end
