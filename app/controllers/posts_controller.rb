class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to @post, notice: 'Your post was created succesfully'
    else
      render 'new'
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
