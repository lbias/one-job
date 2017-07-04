class JobsController < ApplicationController

  def index
    @jobs = Job.published.recent
  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      redirect_to root_path, alert: "此职缺暂未开放。"
    end
  end
  
end
