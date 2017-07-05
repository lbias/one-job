class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:add, :remove]

  def index
    @locations = Location.published.sortA
    @categorys = Category.published.sortA
    @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @job = Job.find(params[:id])
    @category = @job.category
    # 该用户投递此职位的简历数量
    @resumes = Resume.where(:job => @job, :user => current_user)
    if @job.is_hidden
      redirect_to root_path, alert: "此职缺暂未开放。"
    end
  end

  def add
    @job = Job.find(params[:id])
    if !current_user.is_member_of?(@job)
      current_user.add_collection!(@job)
    end
    redirect_to :back
  end

  def remove
    @job = Job.find(params[:id])
    if current_user.is_member_of?(@job)
      current_user.remove_collection!(@job)
    end
    redirect_to :back
  end
end
