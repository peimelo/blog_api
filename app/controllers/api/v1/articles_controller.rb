class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_article, only: %i[show update destroy]

  # GET /articles
  def index
    @articles = current_api_user.articles.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = current_api_user.articles.new(article_params)

    if @article.save
      render json: @article, status: :created, location: api_article_url(@article)
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = current_api_user.articles.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
