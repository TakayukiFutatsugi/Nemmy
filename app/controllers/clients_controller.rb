class ClientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @clients = Client.all
  end
  
  def show
    @client = Client.find(params[:id])
  end
end
