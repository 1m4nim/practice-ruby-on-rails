class PostsController < ApplicationController
  # 【重要】
  # 記事の作成、更新、削除アクションの前に、ユーザーがログインしているか確認します。
  # ログインしていない場合、ログインページにリダイレクトされます。
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    # 記事一覧はログインしていなくても見られるようにします
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: '記事が正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '記事が正常に更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_url, notice: '記事が正常に削除されました。', status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) # 必要に応じてカラムを追加
  end
end
