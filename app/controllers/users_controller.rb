class UsersController < ApplicationController
  before_action :authenticate_client!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
end
