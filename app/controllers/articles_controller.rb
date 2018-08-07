class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def destroy
    find_article
    @article.destroy
    redirect_to root_path
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path
  end

  def edit
    find_article
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
