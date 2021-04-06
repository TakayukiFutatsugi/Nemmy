class UsersController < ApplicationController
  before_action :authenticate_client!
  
  def index
    @users = User.all.order(id: "DESC")
  end
  
  def show
    @user = User.find(params[:id])
  end
end
