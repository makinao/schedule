class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start, :finish, :day, :memo))
    if @post.save
      flash[:success] = "新規登録しました"
      redirect_to :posts
    else
      flash.now[:failure] = "新規登録できませんでした"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start, :finish, :day, :memo))
      flash[:success] = "[#{@post.id}]の情報を更新しました"
      redirect_to :posts
    else
      flash.now[:failure] = "情報の更新できませんでした"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
end
