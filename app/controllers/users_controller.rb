class UsersController < ApplicationController
  before_action :get_user, only: [ :update, :destroy ]
  
  respond_to :json

  def index
    users = if params[:id]
      User.where('id in (?)', params[:id].split(','))
    else
      User.all
    end
    
    render json: users
  end
  
  def create
    user = User.new user_params

    if user.save
      head :created, location: user_url(user)
    else
      head :unprocessable_entity
    end
  end
  
  def update
    head @user.update(user_params) ? :no_content : :unprocessable_entity
  end

  def destroy
    head @user.destroy ? :no_content : :unprocessable_entity
  end

  protected

  def get_user
    head :not_found unless @user = User.where('id = ?', params[:id]).take
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
