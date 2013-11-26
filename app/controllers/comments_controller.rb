class CommentsController < ApplicationController
  before_action :get_parent
  before_action :get_comment, only: [ :update, :destroy ]
  
  respond_to :json

  def index
    @comments = if params[:id]
      Comment.where("id in (?) #{@parent_clause}", params[:id].split(','))
    else
      @parent ? @parent.comments : Comment.all
    end
  end
  
  def create
    comment = if @parent
      @parent.comments.new(comment_params)
    else
      Comment.new(comment_params)
    end

    if comment.save
      head :created, location: comment_url(comment)
    else
      head :unprocessable_entity
    end
  end
  
  def update
    head @comment.update(comment_params) ? :no_content : :unprocessable_entity
  end

  def destroy
    head @comment.destroy ? :no_content : :unprocessable_entity
  end

  protected
  
  def get_parent
    @parent_clause = if params[:user_id]
      head :bad_request unless @parent = User.where('id = ?', params[:user_id]).take
      "and user_id = #{@parent.id}"
    elsif params[:article_id]
      head :bad_request unless @parent = Article.where('id = ?', params[:article_id]).take
      "and article_id = #{@parent.id}"
    else
      ""
    end
  end

  def get_comment
    head :not_found unless @comment =
      Comment.where("id = ? #{@parent_clause}", params[:id]).take
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
