class Admin::LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_website_admin

  def index
    @locations = Location.all.sortA
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    # 新增数据的排序为目前最大排序再 +1
    @location.sort = Location.sortD.first.sort + 1
    if @location.save
      redirect_to admin_locations_path, notice: "工作地点新增成功。"
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    if @location.save
      redirect_to admin_locations_path, notice: "工作地点修改成功。"
    else
      render :edit
    end
  end

private

  def location_params
    params.require(:location).permit(:name,:is_hidden)
  end

end
