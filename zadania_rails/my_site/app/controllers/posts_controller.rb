class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params[:post].permit(:title, :content))
    redirect_to action: "index"
  end
end
