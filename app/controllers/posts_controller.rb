class PostsController < ApplicationController
  def index
    # orderメソッドで降順:descか昇順:asc指定ができる
    @posts = Post.all.order(created: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    # params[:content]に上書き
    @post.content = params[:content]
    if @post.save
      redirect_to("/posts/index")
      # flash[:notice]でフラッシュメッセージ設定HTML側にも必要
      flash[:notice] = "投稿を編集しました"
    else
      # editアクション経由ではなくそのままposts/editを表示できる
      render("posts/edit")
    end
  end


  def create
    @post = Post.new(content: params[:content])
    if @post.save
      redirect_to("/posts/index")
      flash[:notice] = "投稿しました"
    else
      render("posts/new")
    end
  end

  def destroy
    # find_byメソッドで()内の条件に合致するデータを習得することができる
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
    flash[:notice] = "削除しました"
  end

end
