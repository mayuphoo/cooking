class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice:'投稿が完了しました'
    else
      render :new, alert:'投稿できませんでした'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice:'更新できました'
    else
      render :new, alert:'更新できませんでした'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice:'削除が完了しました'
    else
      redirect_to root_path, alert:'削除できませんでした'
    end
  end

private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
