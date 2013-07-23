class SchoolsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :admin_only, except: [:index, :show]
  
  def index
    @schools = School.all
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