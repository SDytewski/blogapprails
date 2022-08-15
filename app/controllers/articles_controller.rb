require 'httparty'
require 'json'


class ArticlesController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc).page(params[:page])
    @response = HTTParty.get("https://newsdata.io/api/1/news?apikey=pub_97288f1a2f44a1c380a3ddcac683ad3a377f&language=en&country=us&q=russia")
    JSON.parse(@response.body)

  end


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

     redirect_to articles_path
   end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
