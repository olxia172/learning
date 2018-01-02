class OpinionsController < ApplicationController
  before_action :find_movie
  before_action :require_user, only: [:destroy]

  def index
    redirect_to movie_path(@movie)
  end

  def create
    @opinion = @movie.opinions.new(opinion_params) # movie.opinions.new przypisuje automatycznie movie_id
    @opinion.user = current_user
    if @opinion.save
      redirect_to movie_path(@movie), notice: 'You successfully added comment'
    else
      #Rails.logger.info @opinion.errors.full_messages.join(', ')
      flash.now.alert = 'Something went wrong. Try again'
      @movie.reload # przeladowanie modelu, aby oproznic arraya opinions
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
