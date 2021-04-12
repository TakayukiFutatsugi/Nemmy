class JobsController < ApplicationController
  before_action :authenticate_client!, only:[:new, :create, :edit, :update, :destroy]
  
  def index
    @jobs = Job.all.order(id: "DESC")
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
      flash[:notice] = "求人情報が投稿されました。" 
    else
      flash[:alert] = "投稿に失敗しました。"
      render :new
    end  
  end

  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to root_path
      flash[:notice] = "求人情報が更新されました。" 
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end  
  end
  
  def destroy
    @job = Job.find_by(id: params[:id])
    if @job.client == current_client
      flash[:notice] = "削除しました" if @job.destroy
    else
      flash[:alert] = "削除できませんでした"
    end
    redirect_to jobs_path
  end

  private
    def job_params
      params.require(:job).permit(:title, :status, :salary, :benefitProgram, :holiday, :language, :framework, :characteristics, :skillset, :selectionProcess, :training, :startingDate, :workplace, :access, :description).merge(client_id: current_client.id)
    end
end
