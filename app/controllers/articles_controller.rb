class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  # before_actionで、ログイン者かつid==1以外は[:new, :create,:edit, :update, :destroy ]が出来ないように設定する。

  def index
    @articles = Article.order(created_at: :desc).search(params[:search])
  end

  def show
    @like = Like.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: '投稿が完了しました'
    else
      render :new, alert: '投稿できませんでした'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: '更新できました'
    else
      render :new, alert: '更新できませんでした'
    end
  end

  def destroy
    if @article.destroy
      redirect_to @article, notice: '削除が完了しました'
    else
      redirect_to root_path, alert: '削除できませんでした'
    end
  end

  def genre
    @article = Article.find_by(genre_id: params[:id])
    @articles = Article.where(genre_id: params[:id]).order('created_at DESC')
  end

  # def search
  #   if params[:title].present?
  #     @articles = Article.where('name LIKE ? ', "%#{params[:title]}%")
  #   else
  #     @articles = Article.none
  #   end 
  # end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :genre_id, images: []).merge(user_id: current_user.id)
  end
end
