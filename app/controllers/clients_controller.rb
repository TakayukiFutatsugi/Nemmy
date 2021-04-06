class ClientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @clients = Client.all.order(id: "DESC")
  end
  
  def show
    @client = Client.find(params[:id])
    @jobs = Job.where(client: @client)
  end
end
