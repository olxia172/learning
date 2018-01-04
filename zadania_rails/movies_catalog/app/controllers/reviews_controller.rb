class ReviewsController < ApplicationController
  #before_action :find_review, only: [:edit, :update, :destroy]
  #before_action :find_movie, only: [:index, :new, :create, :destroy]
  before_action :require_user

  def index
    @movie = Movie.find(params[:movie_id])
    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie), notice: 'You successfully add a review!'
    else
      flash.now.alert = 'Something went wrong. Try again'
      render 'reviews/new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_path(@review.movie), notice: 'You successfully updated this review'
    else
      flash.now.alert = 'Something went wrong. Try again'
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie), notice: 'You successfully deleted a review'
  end

  private

    def find_movie
      @movie = Movie.find(params[:movie_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rate, :body)
    end
end
