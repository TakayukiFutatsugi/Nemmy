class ScoutsController < ApplicationController
  before_action :authenticate_client!
  
  def create
    user = User.find(params[:user_id])
    @scout = current_client.scouts.build do |s|
      s.user = user
      s.message = params[:message]
    end
    if @scout.save
      redirect_to root_path, notice:"Success"
    end  
  end
  
  private
  def scout_params
    params.require(:scout).permit(:user_id, :message)
  end  
end
