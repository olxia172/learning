class OpinionsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @opinion = Opinion.new(movie_id: @movie.id)
    @opinion.attributes = opinion_params
    if @opinion.save
      redirect_to movie_path(@movie)
    else
      redirect_to movies_path
    end
  end

private

  def opinion_params
    params.require(:opinion).permit(:author, :rate, :body)
  end
end
