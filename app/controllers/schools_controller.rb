class SchoolsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :compare]
  before_filter :admin_only, except: [:index, :show, :compare]
  
  def index
    if (params[:zip] && params[:within]) && (!params[:zip].empty? && !params[:within].empty?)
      @search = School.near(params[:zip], params[:within]).search(params[:q])
    else
      @search = School.search(params[:q])
    end
    @schools = @search.result.order('name asc').paginate(:per_page => 2, :page => params[:page])
  end
  
  def import
    School.import(params[:file])
    redirect_to schools_path, notice: "Your file was imported."
  end
  
  def compare
    @schools = School.find(params[:school_ids])
  end
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(params[:school])
    if @school.save
      redirect_to schools_path, notice: "The school has been saved."
    else
      render :new
    end
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      redirect_to @school, notice: "Your school has been updated."
    else
      render :edit
    end
  end
  
  private
  
  def admin_only
    redirect_to root_path, alert: "Whoops, you do not have access to the requested page." if !current_user.admin?
  end
end