class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "記事が正常に投稿されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "記事が正常に更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy! 
    
    redirect_to posts_url, notice: "記事「#{@post.title}」を削除しました。", status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end