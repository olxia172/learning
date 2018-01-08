class ReviewsController < ApplicationController
  before_action :find_movie
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :require_user

  def index
    redirect_to movie_path(@movie)
  end

  def new
    @review = Review.new
  end

  def create
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
  end

  def update
    if @review.update(review_params)
      redirect_to movie_path(@review.movie), notice: 'You successfully updated this review'
    else
      flash.now.alert = 'Something went wrong. Try again'
      render 'edit'
    end
  end

  def destroy
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
