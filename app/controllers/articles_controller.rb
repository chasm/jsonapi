class ArticlesController < ApplicationController
  before_action :get_user
  before_action :get_article, only: [ :update, :destroy ]
  
  respond_to :json

  def index
    articles = if params[:id]
      Article.where("id in (?) #{@user_clause}", params[:id].split(','))
    else
      @user ? @user.articles : Article.all
    end
  
    render json: articles, only: [ :id, :title, :user_id ]
  end
  
  def create
    article = if @user
      @user.articles.new(article_params)
    else
      Article.new(article_params)
    end

    if article.save
      head :created, location: article_url(article)
    else
      head :unprocessable_entity
    end
  end
  
  def update
    head @article.update(article_params) ? :no_content : :unprocessable_entity
  end

  def destroy
    head @article.destroy ? :no_content : :unprocessable_entity
  end

  protected
  
  def get_user
    if params[:user_id]
      head :bad_request unless @user = User.where('id = ?', params[:user_id]).take
    end
  
    @user_clause = @user ? "and user_id = #{@user.id}" : ""
  end

  def get_article
    head :not_found unless @article =
      Article.where("id = ? #{@user_clause}", params[:id]).take
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
