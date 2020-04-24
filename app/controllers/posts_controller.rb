class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end


  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end
end
