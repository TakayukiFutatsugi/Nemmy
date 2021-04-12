class RoomsController < ApplicationController
  before_action :authenticate_client!, only:[:create]
  
  def index
    if user_signed_in?
      @rooms = Room.where(user_id: current_user).order(id: "DESC")
    end
    if client_signed_in?
      @rooms = Room.where(client_id: current_client).order(id: "DESC")
    end
  end  
  
  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    if user_signed_in?
      if @room.user.id == current_user.id
        @client = @room.client
      else
        redirect_to "/"
      end
    elsif client_signed_in?
      if @room.client.id == current_client.id
        @user = @room.user
      else
        redirect_to "/"
      end
  
    else
      redirect_to "/"
    end
  end
  
  def create
    if client_signed_in?
      @room = Room.new(room_user_params)
      @room.client_id = current_client.id
    else
      redirect_to "/"
    end
    
    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to rooms_path
    end
  end
  
  private
  def room_client_params
    params.require(:room).permit(:client_id)
  end
  
  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
