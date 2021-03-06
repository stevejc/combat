class SchoolsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :compare, :remove_school, :update_session]
  before_filter :admin_only, except: [:index, :show, :compare, :remove_school, :update_session]
  
  def index
    session[:school_ids] ||= []
    if (params[:zip] && params[:within]) && (!params[:zip].empty? && !params[:within].empty?)
      @search = School.near(params[:zip], params[:within]).search(params[:q])
    else
      @search = School.search(params[:q])
    end
    @schools = @search.result.order('name asc').paginate(:per_page => 2, :page => params[:page])
    @schools_export = @search.result.order('name asc')
    
    respond_to do |format|
      format.html
      format.csv { send_data @schools_export.to_csv }
    end
  end
  
  def import
    School.import(params[:file])
    redirect_to schools_path, notice: "Your file was imported."
  end
  
  def update_session
    session[:school_ids] ||= []
    session[:checked] = params[:checked]
    session[:my_school] = params[:school_id]
    session[:hi] = "hi mom"
    if params[:checked] == "true"
      session[:school_ids] << params[:school_id]
    else
      session[:school_ids].delete(params[:school_id])
    end
    
    redirect_to schools_path
  end
  
  def compare
    session[:school_ids] ||= []
    params[:school_ids] ||= []
    @schools = School.find(session[:school_ids] | params[:school_ids])
  end
  
  def remove_school
    session[:school_ids].delete(params[:school_id])
    redirect_to compare_path
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