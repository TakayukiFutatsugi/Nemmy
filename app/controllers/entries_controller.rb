class EntriesController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  before_action :authenticate_client!, only:[:index]
  
  def index
    @entries = Entry.all.order(id: "DESC")
  end
  
  def show
    @user = User.find(params[:id])
  end  
  
  def create
    job = Job.find(params[:job_id])
    @entry = current_user.entries.build do |e|
      e.job = job
    end
    if @entry.save
      redirect_to root_path, notice:"応募が完了しました。企業様からの連絡をお待ちください。"
    end  
  end
  
  private
  def entry_params
    params.require(:entry).permit(:job_id)
  end
end
