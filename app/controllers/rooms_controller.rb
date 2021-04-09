class RoomsController < ApplicationController
  before_action :authenticate_client!, only:[:create]
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
    # if user_signed_in?
    #   #userがログインしてたらuser_idを, clientがログインしてたらclient_idを@roomにいれる
    #   @room = Room.new(room_client_params)
    #   @room.user_id = current_user.id
    if client_signed_in?
      @room = Room.new(room_user_params)
      @room.client_id = current_client.id
    else
      redirect_to "/"
    end
  
    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
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
